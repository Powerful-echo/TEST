<?php
namespace app\qingadmin\controller;

use think\facade\Db;
use Redis;
class Order extends Base
{

	
	//会员公共导出数据
	public function excel_table($orderData){
		if(empty($orderData)){
			return alert('导出数据为空','index',5);
		}

		$table='';
		foreach($orderData as $k=>$v){
			$orderData[$k]['mobile']=Db::name('user')->where('id',$v['user_id'])->value('mobile');
			if($v['pay_method']==1){
				$orderData[$k]['pay_method']='微信支付';
			}else{
				$orderData[$k]['pay_method']='支付宝支付';
			}
			$orderData[$k]['time']=date('Y-m-d H:i',$v['time']);
			$orderData[$k]['express_code']=Db::name('express')->where('code',$v['express_code'])->value('name');
			if($orderData[$k]['shou_time']){
				$orderData[$k]['shou_time']=date('Y-m-d H:i',$v['shou_time']);
			}else{
				$orderData[$k]['shou_time']='没有收货';
			}
			if($orderData[$k]['pay_time']){
				$orderData[$k]['pay_time']=date('Y-m-d H:i',$v['pay_time']);
			}else{
				$orderData[$k]['pay_time']='没有支付';
			}

			if($orderData[$k]['status']==0){
				$orderData[$k]['status']='没有支付';
			}elseif($orderData[$k]['status']==1){
				$orderData[$k]['status']='待发货';
			}elseif($orderData[$k]['status']==2){
				$orderData[$k]['status']='已完成';
			}elseif($orderData[$k]['status']==4){
				$orderData[$k]['status']='待收货';
			}elseif($orderData[$k]['status']==3){
				$orderData[$k]['status']='退换货';
			}

		}
		$table .= "<table>
		<thead>
			<tr>
				<th class='name'>ID</th>
				<th class='name'>订单号</th>
				<th class='name'>会员手机号</th>
				<th class='name'>下单时间</th>
				<th class='name'>收货人姓名</th>
				<th class='name'>收货人电话</th>
				<th class='name'>收货人地址</th>
				<th class='name'>订单备注</th>
				<th class='name'>订单总价</th>
				<th class='name'>订单状态</th>
				<th class='name'>支付方式</th>
				<th class='name'>支付时间</th>
				<th class='name'>快递单号</th>
				<th class='name'>快递公司</th>
				<th class='name'>收货时间</th>	
			</tr>
		</thead>
		<tbody>";
		foreach ($orderData as $v) {
			$table .= "<tr>
					<td class='name'>{$v['id']}</td>
					<td class='name'>{$v['out_trade_no']}</td>
					<td class='name'>{$v['mobile']}</td>
					<td class='name'>{$v['time']}</td>
					<td class='name'>{$v['shou_name']}</td>
					<td class='name'>{$v['shou_mobile']}</td>
					<td class='name'>{$v['shou_address']}</td>
					<td class='name'>{$v['content']}</td>
					<td class='name'>{$v['total_price']}</td>
					<td class='name'>{$v['status']}</td>
					<td class='name'>{$v['pay_method']}</td>
					<td class='name'>{$v['pay_time']}</td>
					<td class='name'>{$v['postcode']}</td>
					<td class='name'>{$v['express_code']}</td>
					<td class='name'>{$v['shou_time']}</td>
				</tr>";
		}
		$table .= "</tbody>
		</table>";

		//通过header头控制输出excel表格
		header("Pragma: public");  
		header("Expires: 0");  
		header("Cache-Control:must-revalidate, post-check=0, pre-check=0");  
		header("Content-Type:application/force-download");  
		header("Content-Type:application/vnd.ms-execl");  
		header("Content-Type:application/octet-stream");  
		header("Content-Type:application/download");;  
		header('Content-Disposition:attachment;filename="用户表.xls"');  
		header("Content-Transfer-Encoding:binary");  
		echo $table;
	}

	//导出全部数据
	public function excel_all(){
		$orderData = Db::name('order')->select()->toArray();
		$this->excel_table($orderData);
	}

	//导出部分数据
    public function excel_some_select(){
        $start_time0=$end_time0='';
		$start_time0=input('get.start_time');
		$end_time0=input('get.end_time');

		$search_key=input('request.search_key')?input('request.search_key'):'';
		
		
		//2020-01-02 时间戳
		$start_time=strtotime($start_time0);
		$end_time=strtotime($end_time0);
		
		$where=[];


        if($start_time && $end_time){
			$where[] = [
				['time','between',[$start_time, $end_time]]
			];
		}elseif($start_time){
			$where[] = [
				['time','>',$start_time]
			];
		}elseif($end_time){
			$where[] = [
				['time','<',$end_time]
			];
		}


		$orderData=Db::name('order')->where('shou_mobile','like','%'.$search_key.'%')->where($where)->order('id desc')->paginate(['list_rows'=> 10,'query'=>request()->param()]);
        
        

        $orderData1=Db::name('order')->where('shou_mobile','like','%'.$search_key.'%')->where($where)->order('id desc')->select()->toArray();

        session('excel_orderData',$orderData1);

        return view('',[
            'left_menu'=>3,
            'search_key'=>$search_key,
            'orderData'=>$orderData,
            'start_time'=>$start_time0,
			'end_time'=>$end_time0,
        ]);
	}
	
	public function excel_some(){
        $orderData=session('excel_orderData');
        $this->excel_table($orderData);
    }

	
}
