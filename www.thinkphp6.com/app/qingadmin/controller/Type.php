<?php
namespace app\qingadmin\controller;
use think\Controller;
use think\facade\Request;
use app\common\validate\TypeValidate;
use think\facade\Db;
class Type extends  Base
{

    //商品类型列表
    public function index()
    {
      $types=Db::name('Type')->order('id desc')->paginate(15);
      return view('',[
         'types'=>$types,
        ]);

    }

    /*添加类型*/
    public function add(){
       if(request()->isPost()){
         $data=request()->post();
         $res=Db::name('type')->where('type_name',$data['type_name'])->find();
         if($res){
            $this->error('已经添加过了','index');
         }
         $res=Db::name('type')->insert($data);
         if($res){
            return alert('添加成功','index',6,3);
         }else{
            return alert('添加失败','index',5,3);
         }
       }
       return view();
    }

    /*修改类型*/
    public function edit(){
       //先取出填充的数据
       $id=Request::instance()->param('id');
       $types=Db::name('type')->find($id);       
       
       return view('',[
         'types'=>$types,

        ]);

    }


    public function update(){
      //处理post过来的数据
       if(request()->isPost()){
         $data=request()->post();
         $res=Db::name('type')->where('type_name',$data['type_name'])->find();
         if($res){
            $this->error('已经添加过了','index');
         }
         $res=Db::name('Type')->update($data);
         if($res){
            return alert('操作成功','index',6,3);
         }else{
            return alert('操作失败','index',5,3);
         }
       }
    }

    //删除类型,删除类型下的所有属性
    public function delete(){
      $id=Request::instance()->param('id');
      $standardData=Db::name('standard')->where('type_id',$id)->select();
      
      Db::transaction(function () {
         //循环删除属性值
         foreach($standardData as $k=>$v){
            Db::name('standard_value')->where('standard_id',$v['id'])->delete();
         }
   
         //删除属性
         Db::name('standard')->where('type_id',$v['id'])->delete();
         
         //删除类型
         $res=Db::name('type')->where('id',$id)->delete();
      });
      
      if($res){
         return alert('操作成功','index',6,3);
      }else{
         return alert('操作失败','index',5,3);
      }
    }
    
    
}
