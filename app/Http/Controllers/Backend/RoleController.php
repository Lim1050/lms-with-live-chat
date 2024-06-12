<?php

namespace App\Http\Controllers\Backend;

use App\Exports\PermissionExport;
use App\Exports\RoleExport;
use App\Http\Controllers\Controller;
use App\Imports\PermissionImport;
use App\Imports\RoleImport;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Intervention\Image\Colors\Rgb\Channels\Red;
use Maatwebsite\Excel\Facades\Excel;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;

class RoleController extends Controller
{
    public function AllPermission()
    {
        $permission = Permission::all();
        return view('admin.backend.pages.permission.all_permission', compact('permission'));
    }

    public function AddPermission()
    {
        return view('admin.backend.pages.permission.add_permission');
    }

    public function StorePermission(Request $request)
    {
        Permission::create([
            'name' => $request->name,
            'group_name' => $request->group_name,
        ]);

        // notification
        $notification = array(
            'message' => 'Permission Created Successfully!',
            'alert-type' => 'success'
        );
        return redirect()->route('all.permission')->with($notification);
    }

    public function EditPermission($id)
    {
        $permission = Permission::find($id);
        return view('admin.backend.pages.permission.edit_permission', compact('permission'));
    }

    public function UpdatePermission(Request $request)
    {
        $per_id = $request->id;
        Permission::find($per_id)->update([
            'name' => $request->name,
            'group_name' => $request->group_name,
        ]);

        // notification
        $notification = array(
            'message' => 'Permission Updated Successfully!',
            'alert-type' => 'success'
        );
        return redirect()->route('all.permission')->with($notification);
    }

    public function DeletePermission($id)
    {
        Permission::find($id)->delete();

        // notification
        $notification = array(
            'message' => 'Permission Deleted Successfully!',
            'alert-type' => 'success'
        );
        return redirect()->back()->with($notification);
    }

    public function ImportPermission()
    {
        return view('admin.backend.pages.permission.import_permission');
    }

    public function ExportPermission()
    {
        return Excel::download(new PermissionExport, 'permissions.xlsx');
    }

    public function UploadPermission(Request $request)
    {
        Excel::import(new PermissionImport, $request->file('import_file'));

        // notification
        $notification = array(
            'message' => 'Permission Imported Successfully!',
            'alert-type' => 'success'
        );
        return redirect()->route('all.permission')->with($notification);
    }

    public function AllRoles()
    {
        $roles = Role::all();
        return view('admin.backend.pages.roles.all_roles', compact('roles'));
    }

    public function AddRoles()
    {
        return view('admin.backend.pages.roles.add_roles');
    }

    public function StoreRoles(Request $request)
    {
        Role::create([
            'name' => $request->name,
        ]);

        // notification
        $notification = array(
            'message' => 'Role Created Successfully!',
            'alert-type' => 'success'
        );
        return redirect()->route('all.roles')->with($notification);
    }

    public function EditRoles($id)
    {
        $roles = Role::find($id);
        return view('admin.backend.pages.roles.edit_roles', compact('roles'));
    }

    public function UpdateRoles(Request $request)
    {
        $role_id = $request->id;
        Role::find($role_id)->update([
            'name' => $request->name
        ]);

        // notification
        $notification = array(
            'message' => 'Role Updated Successfully!',
            'alert-type' => 'success'
        );
        return redirect()->route('all.roles')->with($notification);
    }

    public function DeleteRoles($id)
    {
        Role::find($id)->delete();

        // notification
        $notification = array(
            'message' => 'Role Deleted Successfully!',
            'alert-type' => 'success'
        );
        return redirect()->back()->with($notification);
    }

    public function ExportRoles()
    {
        return Excel::download(new RoleExport, 'roles.xlsx');
    }
    public function ImportRoles()
    {
        return view('admin.backend.pages.roles.import_roles');
    }

    public function UploadRoles(Request $request)
    {
        Excel::import(new RoleImport, $request->file('import_file'));

        // notification
        $notification = array(
            'message' => 'roles Imported Successfully!',
            'alert-type' => 'success'
        );
        return redirect()->route('all.roles')->with($notification);
    }

    // Add Role Permission
    public function AllRolePermission()
    {
        $roles = Role::all();
        return view('admin.backend.pages.rolesetup.all_role_permission', compact('roles'));
    }

    public function AddRolePermission()
    {
        $roles = Role::all();
        $permissions = Permission::all();
        $permission_groups = User::getpermissionGroups();
        return view('admin.backend.pages.rolesetup.add_role_permission', compact('roles', 'permissions', 'permission_groups'));
    }

    public function StoreRolePermission(Request $request)
    {
        $data = array();
        $permissions = $request->permission;

        foreach ($permissions as $key => $item) {
            $data['role_id'] = $request->role_id;
            $data['permission_id'] = $item;

            DB::table('role_has_permissions')->insert($data);
        }

        // notification
        $notification = array(
            'message' => 'Role Permission Added Successfully!',
            'alert-type' => 'success'
        );
        return redirect()->route('all.role.permission')->with($notification);
    }

    public function EditRolePermission($id)
    {
        $role = Role::find($id);
        $permissions = Permission::all();
        $permission_groups = User::getpermissionGroups();
        return view('admin.backend.pages.rolesetup.edit_role_permission', compact('role', 'permissions', 'permission_groups'));
    }

    public function UpdateRolePermission(Request $request, $id)
    {
        $role = Role::find($id);
        $permissions = collect($request->input('permission'))
        ->map(fn($val) => (int)$val)
        ->all();

        if (!empty($permissions)) {
            $role->syncPermissions($permissions);
        }

        // notification
        $notification = array(
            'message' => 'Role Permission Updated Successfully!',
            'alert-type' => 'success'
        );
        return redirect()->route('all.role.permission')->with($notification);
    }

    public function DeleteRolePermission($id)
    {
        $role = Role::find($id);
        if(!is_null($role)){
            $role->delete();
        }

        // notification
        $notification = array(
            'message' => 'Role Permission Deleted Successfully!',
            'alert-type' => 'success'
        );
        return redirect()->back()->with($notification);
    }
}
