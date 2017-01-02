<?php /* Smarty version Smarty-3.1.13, created on 2013-05-06 13:56:30
         compiled from ".\templates\index.htm" */ ?>
<?php /*%%SmartyHeaderCode:14415187b68eb48dd1-09473312%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '051f931158ab43d8f98eed833984a03bdbf9a32d' => 
    array (
      0 => '.\\templates\\index.htm',
      1 => 1367848367,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '14415187b68eb48dd1-09473312',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'values' => 0,
    'id' => 0,
    'name' => 0,
    'title' => 0,
    'titles' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.13',
  'unifunc' => 'content_5187b69052a104_10063436',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5187b69052a104_10063436')) {function content_5187b69052a104_10063436($_smarty_tpl) {?><?php if (!is_callable('smarty_modifier_capitalize')) include 'D:\\studymyself\\php\\smarty01\\Smarty\\plugins\\modifier.capitalize.php';
?><html>
<hr>
<?php echo $_smarty_tpl->getSubTemplate ('head.htm', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array('title'=>"这是个首页"), 0);?>

<p><b><font color="red">
<?php if (!isset($_smarty_tpl->tpl_vars['name'])) $_smarty_tpl->tpl_vars['name'] = new Smarty_Variable(null);if ($_smarty_tpl->tpl_vars['name']->value = ''){?>
nothing
<?php }else{ ?>
something
<?php }?>

<hr>
<?php  $_smarty_tpl->tpl_vars['id'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['id']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['values']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['id']->key => $_smarty_tpl->tpl_vars['id']->value){
$_smarty_tpl->tpl_vars['id']->_loop = true;
?>
数组内容：<?php echo $_smarty_tpl->tpl_vars['id']->value;?>
<br>
<?php } ?>

<hr>
原始内容：<?php echo $_smarty_tpl->tpl_vars['name']->value;?>
<br>
首字母大写：<?php echo smarty_modifier_capitalize($_smarty_tpl->tpl_vars['name']->value);?>
<br>
计算字符数：<?php echo preg_match_all('/[^\s]/u',$_smarty_tpl->tpl_vars['name']->value, $tmp);?>
<br>

</font></b></p>

<hr>
<p><b><font color="red"><?php echo $_smarty_tpl->tpl_vars['title']->value;?>
</font></b></p>

<hr>
循环数组<br>
<?php if (isset($_smarty_tpl->tpl_vars['smarty']->value['section']['list'])) unset($_smarty_tpl->tpl_vars['smarty']->value['section']['list']);
$_smarty_tpl->tpl_vars['smarty']->value['section']['list']['name'] = 'list';
$_smarty_tpl->tpl_vars['smarty']->value['section']['list']['loop'] = is_array($_loop=$_smarty_tpl->tpl_vars['titles']->value) ? count($_loop) : max(0, (int)$_loop); unset($_loop);
$_smarty_tpl->tpl_vars['smarty']->value['section']['list']['show'] = true;
$_smarty_tpl->tpl_vars['smarty']->value['section']['list']['max'] = $_smarty_tpl->tpl_vars['smarty']->value['section']['list']['loop'];
$_smarty_tpl->tpl_vars['smarty']->value['section']['list']['step'] = 1;
$_smarty_tpl->tpl_vars['smarty']->value['section']['list']['start'] = $_smarty_tpl->tpl_vars['smarty']->value['section']['list']['step'] > 0 ? 0 : $_smarty_tpl->tpl_vars['smarty']->value['section']['list']['loop']-1;
if ($_smarty_tpl->tpl_vars['smarty']->value['section']['list']['show']) {
    $_smarty_tpl->tpl_vars['smarty']->value['section']['list']['total'] = $_smarty_tpl->tpl_vars['smarty']->value['section']['list']['loop'];
    if ($_smarty_tpl->tpl_vars['smarty']->value['section']['list']['total'] == 0)
        $_smarty_tpl->tpl_vars['smarty']->value['section']['list']['show'] = false;
} else
    $_smarty_tpl->tpl_vars['smarty']->value['section']['list']['total'] = 0;
if ($_smarty_tpl->tpl_vars['smarty']->value['section']['list']['show']):

            for ($_smarty_tpl->tpl_vars['smarty']->value['section']['list']['index'] = $_smarty_tpl->tpl_vars['smarty']->value['section']['list']['start'], $_smarty_tpl->tpl_vars['smarty']->value['section']['list']['iteration'] = 1;
                 $_smarty_tpl->tpl_vars['smarty']->value['section']['list']['iteration'] <= $_smarty_tpl->tpl_vars['smarty']->value['section']['list']['total'];
                 $_smarty_tpl->tpl_vars['smarty']->value['section']['list']['index'] += $_smarty_tpl->tpl_vars['smarty']->value['section']['list']['step'], $_smarty_tpl->tpl_vars['smarty']->value['section']['list']['iteration']++):
$_smarty_tpl->tpl_vars['smarty']->value['section']['list']['rownum'] = $_smarty_tpl->tpl_vars['smarty']->value['section']['list']['iteration'];
$_smarty_tpl->tpl_vars['smarty']->value['section']['list']['index_prev'] = $_smarty_tpl->tpl_vars['smarty']->value['section']['list']['index'] - $_smarty_tpl->tpl_vars['smarty']->value['section']['list']['step'];
$_smarty_tpl->tpl_vars['smarty']->value['section']['list']['index_next'] = $_smarty_tpl->tpl_vars['smarty']->value['section']['list']['index'] + $_smarty_tpl->tpl_vars['smarty']->value['section']['list']['step'];
$_smarty_tpl->tpl_vars['smarty']->value['section']['list']['first']      = ($_smarty_tpl->tpl_vars['smarty']->value['section']['list']['iteration'] == 1);
$_smarty_tpl->tpl_vars['smarty']->value['section']['list']['last']       = ($_smarty_tpl->tpl_vars['smarty']->value['section']['list']['iteration'] == $_smarty_tpl->tpl_vars['smarty']->value['section']['list']['total']);
?>
<p><b><font color="red">

<?php echo $_smarty_tpl->tpl_vars['titles']->value[$_smarty_tpl->getVariable('smarty')->value['section']['list']['index']]['name'];?>
   <?php echo $_smarty_tpl->tpl_vars['titles']->value[$_smarty_tpl->getVariable('smarty')->value['section']['list']['index']]['date'];?>


</font></b></p>
<?php endfor; endif; ?>
<hr>


</html><?php }} ?>