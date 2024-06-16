<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use GroceryCrud\Core\GroceryCrud;
use Illuminate\Database\Events\StatementPrepared;
use Illuminate\Support\Facades\Hash;
use PharIo\Manifest\Url;
use Illuminate\Support\Facades\Redirect;

class UsersController extends Controller
{
     /**
     * An empty index page for navigation purposes.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    public function mendaftar(){
        return view('mendaftar');
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

    public function registrasi(Request $request)
    {
        $database = $this->_getDatabaseConnection();
        $config = config('grocerycrud');

        $crud = new GroceryCrud($config, $database);
        // $crud->setTheme('bootstrap-v4');
        $crud->setTable('users');
        $crud->setSubject('Users', 'Users');
        // $crud->columns(['name']);
        
        $crud->addFields(['name','email','password']);
        
        $crud->callbackBeforeInsert(function ($stateParameters) {
            $stateParameters->data['password'] = Hash::make($stateParameters->data['password']);
            return $stateParameters;
        });

        $crud->callbackBeforeUpdate(function ($stateParameters) {
            $stateParameters->data['password'] = Hash::make($stateParameters->data['password']);
            return $stateParameters;
        });

        // $crud->where([
        //     'id' => -1,
        // ]);
        // $crud->where([
        //     '1=? limit 3' => 1
        // ]);
        
        // $crud->callbackAfterInsert(function ($stateParameters) {
        //     $redirectResponse = new \GroceryCrud\Core\Redirect\RedirectResponse();
        //     return $redirectResponse->setUrl(route('login'));
        // });
        // echo $request->segment(2);
        // if($request->segment(2)==""){
        //     return Redirect::to(route('login'));
        // }

        // $crud->callbackAddField('name',function ($stateParameters){
        //     return "<input type='text' class='gc-form-input-106 form-control' style='margin-top:10px;'>";
        // });
        $crud->setConfig('open_in_modal', false);
        $crud->setConfig('actions_column_side', 'right');
        $crud->setConfig('paging_options', [3,20,50,100]);
        $crud->setConfig('default_per_page', 3);
        $crud->setConfig('publish_events', true);
        $crud->setConfig('actions_column_side', 'left');
        
        
        $crud->requiredAddFields(['name','email','password']);
        $crud->displayAs('name','Nama');
        $crud->fieldType('password', 'password');
        $crud->fieldType('email', 'email');

        //$crud->unsetColumns(['id','name','email','password','remember_token','email_verified_at','created_at','updated_at']);
        // $crud->setPrimaryKey('email','users');
        // $crud->unsetFilters();
        // $crud->unsetColumnsButton();
        // $crud->unsetPrint();
        // $crud->unsetExport();
        // $crud->unsetSettings();
        // $crud->unsetOperations();
        // $crud->unsetTools();
        // $crud->unsetCssIcons();
        // $crud->unsetSettings();
        // $crud->unsetTools();
        //$crud->unsetSearchColumns(['remember_token','email_verified_at','created_at','updated_at']);
        
        $crud->defaultOrdering('id', 'desc');

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
        
        return view('default_template2', [
            'output' => $output,
            'css_files' => $css_files,
            'js_files' => $js_files,
            'tambahan' => "<script>window.addEventListener('gcrud.form.modal-close', () => {
                window.location.replace('". route('login') ."');
            });</script>",
            'judul' => "Registrasi",
        ]);
        
    }
    
    
}
