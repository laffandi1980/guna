<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use GroceryCrud\Core\GroceryCrud;
use Illuminate\Database\Events\StatementPrepared;
use Illuminate\Support\Facades\Hash;
use PharIo\Manifest\Url;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\DB;

class CrudController extends Controller
{
     /**
     * An empty index page for navigation purposes.
     *
     * @return \Illuminate\Http\Response
     */
    private $x;
    public function index()
    {
        //
    }

    private function _getDatabaseConnection() {
        $databaseConnection = config('database.default');
        $databaseConfig = config('database.connections.' . $databaseConnection);


        return [
            'adapter' => [
                'driver' => 'Pdo_Mysql',
                'database' => $databaseConfig['database'],
                'username' => $databaseConfig['username'],
                'password' => $databaseConfig['password'],
                'host' => $databaseConfig['host'],
                'charset' => 'utf8'
            ]
        ];
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function datagrid()
    {
        $database = $this->_getDatabaseConnection();
        $config = config('grocerycrud');

        $crud = new GroceryCrud($config, $database);

        $crud->setTable('users');
        $crud->setSubject('Users', 'Users');
        $crud->columns(['name','email','password']);
        
        $crud->addFields(['name','email','password']);
        $crud->callbackColumn('password', function ($value, $row) {
            if (!empty($value)) {
                return "<a class='btn btn-info' href='/users/" . $row->id."' target='blank'>$value</a>";
            } else {
                // Make sure that you return white space or else the cell may break on print layout
                return '&nbsp;';
            }
        });
        // $crud->displayAs('password','jumlah');
        // $crud->callbackColumn('password',array($this,'_opo'));
    
        $crud->setActionButton('Pesan', 'fa fa-user-plus', function ($row) {
            return 'javascript:alert("opoo")';},false);   

        $crud->callbackBeforeInsert(function ($stateParameters) {
            $stateParameters->data['password'] = Hash::make($stateParameters->data['password']);
            return $stateParameters;
        });

        $crud->callbackBeforeUpdate(function ($stateParameters) {
            $stateParameters->data['password'] = Hash::make($stateParameters->data['password']);
            return $stateParameters;
        });

        // $crud->callbackEditField('password', function ($fieldValue, $primaryKeyValue, $rowData) {
        //     return '<input type="password" class="form-control" name="password" value="" placeholder="Masukkan Password Baru"  />';
        // });
        $crud->setConfig('open_in_modal', false);
        $crud->setConfig('paging_options', [5,10,15,20,25,30,35,40,45,50,100]);
        $crud->setConfig('default_per_page', 5);
        // $crud->setConfig('xss_clean', true);
        $crud->displayAs('name','Nama');
        $crud->fieldType('password', 'password');
        $crud->fieldType('email', 'email');
        $crud->requiredAddFields(['name','email','password']);

        $crud->setCsrfTokenName('_token');
        $crud->setCsrfTokenValue(csrf_token());

        $output = $crud->render();

        if ($output->isJSONResponse) {

            header('Content-Type: application/json; charset=utf-8');
            echo $output->output;
            exit;
        }
        $css_files = $output->css_files;
        $js_files = $output->js_files;
        $output = $output->output;

        return view('default_template', [
            'output' => $output,
            'css_files' => $css_files,
            'js_files' => $js_files
        ]);
        
    }

    public function manajemencrud(Request $request)
    {
        $database = $this->_getDatabaseConnection();
        $config = config('grocerycrud');

        $crud = new GroceryCrud($config, $database);
        // $crud->setTheme('bootstrap-v4');
        $crud->setTable('menus');
        $crud->setSubject('Menu', 'Menu');
        $crud->columns(['menu','status','anggota','link']);
        
        $crud->addFields(['menu','status','anggota','link']);
        $crud->editFields(['menu','status','anggota','link']);
        
        $crud->callbackBeforeInsert(function ($stateParameters) {
            $stateParameters->data['slug'] = md5($stateParameters->data['menu'].date("Y-m-d h:s"));
            return $stateParameters;
        });
        $crud->callbackColumn('anggota', function ($value, $row) {
            $posts = DB::select('SELECT * FROM menus where id=?',array($value));
            $data=NULL;
            foreach($posts as $post) { 
                if($post->status=="menu"){
                    $data=$post->menu;
                }
            }
            return $data;
        });
        // woke
        $crud->callbackColumn('menu', function ($value, $row) {
            $data=NULL;
            if($row->status=="sub menu"){
                $data="-- ".$row->menu;
            }else{
                $data=$value;
            }
            return $data;
        });
        
        // $crud->callbackBeforeUpdate(function ($stateParameters) {
        //     $stateParameters->data['password'] = Hash::make($stateParameters->data['password']);
        //     return $stateParameters;
        // });

        // $crud->where([
        //     'id' => -1,
        // ]);
        // $crud->where([
        //     '1=? limit 3' => 1
        // ]);
        
        // $crud->callbackAfterInsert(function ($stateParameters) {
            // $redirectResponse = new \GroceryCrud\Core\Redirect\RedirectResponse();
            // return $redirectResponse->setUrl(route('login'));
            // $stateParameters->data['slug'] = Hash::make($stateParameters->data['id']);
            // $stateParameters->data['slug']= "luqman";
            // return $stateParameters;
            // $callbackAfterInsertModel->updateCustomerName($stateParameters->insertId);
        //     $stateParameters = (object)[
        //         // 'id' => '20', //primary key value after insert
        //         'data' => [ // data to insert
        //             'slug' => 'John',
                    
        //         ]
        //     ];
        //     return $stateParameters;
        // });
        // });
        // echo $request->segment(2);
        // if($request->segment(2)==""){
        //     return Redirect::to(route('login'));
        // }

        $crud->callbackAddField('anggota',function ($stateParameters){
    
            $posts = DB::select('SELECT * FROM menus where status="menu"');
            $this->x="<option value=''>-</option>";
            foreach($posts as $post) { 
                $this->x.="<option value='".$post->id."'>".$post->menu."</option>";
            }
            return "<select class='gc-form-input-106 form-control' style='margin-top:10px;' name='anggota' id='anggota'>
                    ".$this->x."
            </select>
            ";
        });
        // $crud->setConfig('open_in_modal', false);
        $crud->setConfig('actions_column_side', 'right');
        $crud->setConfig('paging_options', [10,50,100,200]);
        $crud->setConfig('default_per_page', 10);
        $crud->setConfig('publish_events', true);
        $crud->setConfig('actions_column_side', 'left');
        
        
        // $crud->requiredAddFields(['menu','status','link']);
        // $crud->displayAs('name','Nama');
        // $crud->fieldType('password', 'password');
        // $crud->fieldType('email', 'email');

        //$crud->unsetColumns(['id','name','email','password','remember_token','email_verified_at','created_at','updated_at']);
        $crud->setPrimaryKey('slug','menus');
        $crud->unsetFilters();
        $crud->unsetColumnsButton();
        $crud->unsetPrint();
        $crud->unsetExport();
        $crud->unsetSettings();
        // $crud->unsetOperations();
        
        // $crud->unsetTools();
        // $crud->unsetCssIcons();
        // $crud->unsetSettings();
        //$crud->unsetSearchColumns(['remember_token','email_verified_at','created_at','updated_at']);
        
        // $crud->defaultOrdering('id_menu', 'desc');

        $crud->setCsrfTokenName('_token');
        $crud->setCsrfTokenValue(csrf_token());

        $output = $crud->render();

        if ($output->isJSONResponse) {

            header('Content-Type: application/json; charset=utf-8');
            echo $output->output;
            // echo "ini lho ".$output->output;
            exit;
        }

        $css_files = $output->css_files;
        $js_files = $output->js_files;
        $output = $output->output;
        // untuk menu
        $postMenu = DB::select('SELECT * FROM menus');
        
        return view('default_template1', [
            'output' => $output,
            'css_files' => $css_files,
            'js_files' => $js_files,
            'tambahan' => "<script>window.addEventListener('gcrud.form.modal-close', () => {
                window.location.replace('". route('crud') ."');
            });</script>",
            'judul' => "Manajemen Menu",
            'menu' => $postMenu,
        ]);
        
    }
    
    
    
}
