<?php include('view/template/common/header.tpl'); ?>
<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<?php if ($_SESSION['success']) { ?>
<div class="success"><?php echo $_SESSION['success']; ?></div>
<?php } unset($_SESSION['success']); ?>
<div class="box">
  <div class="left"></div>
  <div class="right"></div>
  <div class="heading">
    <h1 style="background-image: url('./view/image/order.png');"><?php echo $heading_title; ?></h1>
    <div class="buttons"><a onclick="location = '<?php echo $link_add; ?>'" class="button"><span><?php echo $button_add; ?></span></a><a onclick="$('#form').attr('action', '<?php echo $delete; ?>'); $('#form').attr('target', '_self'); $('#form').submit();" class="button"><span><?php echo $button_delete; ?></span></a></div>
  </div>
  <div class="content">
    <form action="" method="post" enctype="multipart/form-data" id="form">
      <table class="list">
        <thead>
          <tr>
            <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
            <td class="left" width="50">
                <a href="<?php echo $sort_order; ?>"> <?php echo $hinh_anh; ?></a>
            </td>
            
            <td class="left"> 
              <a href="<?php echo $sort_order; ?>"><?php echo $tieu_de; ?></a>
            </td>
             <td class="left" width="100"> 
              <a href="<?php echo $sort_order; ?>"><?php echo $luot_xem; ?></a>
            </td>
            
            <td class="left" width="180">
              <a href="<?php echo $sort_name; ?>"><?php echo $thoi_gian; ?></a></td>     
            </td>
            <td class="right"><?php echo $cot_thao_tac; ?></td>
          </tr>
        </thead>
        <tbody>
         
          <?php if ($list_news) { ?>
          <?php foreach ($list_news as $tintuc) { ?>
          <tr>
            <td style="text-align: center;"><?php if ($order['selected']) { ?>
              <input type="checkbox" name="selected[]" value="<?php echo $order['order_id']; ?>" checked="checked" />
              <?php } else { ?>
              <input type="checkbox" name="selected[]" value="<?php echo $order['order_id']; ?>" />
              <?php } ?></td>

                <?php if($tintuc['hinh_anh']){?>
            <td class="left" width="50">
              <a href="<?php echo $tintuc['hinh_anh']; ?>"class="thickbox" rel="shadowbox">
              <img src ="<?php echo $tintuc['hinh_anh'];?>" class="bimg" width="50" height ="50"/>
             </a>
             </td>
            <?php } else{?>
              <td class="left" width="50">

              <img src ="../data/images/no_image.jpg" class="bimg" width="50" height ="50"/>

           </td>
            <?php } ?>
            <td class="left"><?php echo $tintuc['tieu_de']; ?></td>
            <td class="left"><?php echo $tintuc['luot_xem_id']; ?></td>
            <td class="left"><?php echo $tintuc['time']; ?></td>
            <td class="right" width="80">
            [ <a href="index.php?module=news&act=<?php echo "edit";?>&id=<?php echo $tintuc['id_news']; ?>"><?php echo "Sửa"; ?></a> ]
            [ <a href="javascript:confirmDelete('index.php?module=news&act=del&id=<?=$tintuc['id_news']?>')"  ><?php echo "Xóa"; ?></a>]
            </td>
          </tr>
          <?php } ?>
          <?php } else { ?>
          <tr>
            <td class="center" colspan="7"><?php echo $text_no_results; ?></td>
          </tr>
          <?php } ?>
        </tbody>
      </table>
      
    </form>
    <div class="pagination"><?php echo $pagination; ?></div>
  </div>
</div>

<script type="text/javascript" src="./theme/javascript/jquery/ui/ui.datepicker.js"></script>
<script type="text/javascript"><!--
$(document).ready(function() {
	$('#date').datepicker({dateFormat: 'dd-mm-yy'});
});
//--></script>
<?php include('view/template/common/footer.tpl'); ?>