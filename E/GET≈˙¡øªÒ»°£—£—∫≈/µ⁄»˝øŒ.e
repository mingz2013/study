CNWTEPRGs��
s ��Ϫ��ͻ��s s s s s            <                                                                                                 s��us �ú���λ��s s s s s            X                                                                                                                                  s��;s �����Э��s s s s s          )�`�M                                              R�`R Y�  L� `�� 
 	   _��������   �ڳ����������Զ����뱾����	       	            �   j  �  �  <  �  |  �  �                           ��2   2     �                                                                      �                                                                       	   webQQ��¼    �                         ͼƬ��1  @*�h   H   X   8                                                                    �                  n                         �༭��3  0,�8   H   (   8                                                          �   
                      ��ǩ3  P-�   H   0   8                                                                        ��� ��� ���        �       ��� ��� ���                       ��֤�룺        �                         ��ť1  0.��   H   8   0                                                                                  ��¼n                         �༭��2  �.�0   (   �                                                             �   
                      ��ǩ2  @�   (   8                                                                           ��� ��� ���        �       ��� ��� ���                       QQ����        n                         �༭��1   �0      �                                                             �   
                      ��ǩ1  @�      8                                                                           ��� ��� ���        �       ��� ��� ���                       QQ��        �� �`   ����1       �  �`�`�`�`    k   �   U  g                           �'�2   2   L  �                                                         r                         �༭��_ǩ��  0 �P   0   �                                                             p   
                      ��ǩ_�ǳ�  P!�P      �                                                             r                         ͼƬ��_ͷ��  0"�      H   8                                                             E  �`�`�4�4�4�4�4�4�4�4�4       9   {       #  <  @(  �*  ?D      ����1     "vfwebqq":"     ����2  	   lnick":" >    �������� ([\s\S]*?)�����������ݣ��������з�    ([\s\S]*?) �   Э��ͷ_��ҳ ��ҳ��Ĭ��Э��ͷ p  Accept-Language: zh-cn
User-Agent: Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1)
Accept: image/jpeg, application/x-ms-application, image/gif, application/xaml+xml, image/pjpeg, application/x-ms-xbap, application/x-shockwave-flash, application/vnd.ms-excel, application/vnd.ms-powerpoint, application/msword, */*
Content-Type: application/x-www-form-urlencoded �    Э��ͷ_WAP WAP��Э��ͷ �   User-Agent: Mozilla/5.0 (Linux; U; Android 2.2) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 Mobile Safari/533.1
Accept: text/vnd.wap.wml, image/gif, image/png, image/jpg, image/jpeg, image/vnd.wap.wbmp, */*     MAX_BUF        �@    GZIP_LVL        @ %   JS������  �$  function CLASS_FORMAT(code){

function Hashtable(){
this._hash=new Object();
this.add=function (key,value){
if(typeof(key)!="undefined"){
if(this.contains(key)==false){
this._hash[key]=typeof(value)=="undefined"?null:value;
return true;
};else {
return false;
};
};else {
return false;
};
};
this.remove=function (key){delete this._hash[key];};
this.count=function (){var i=0;for(var k in this._hash){i++;};return i;};
this.items=function (key){return this._hash[key];};
this.contains=function (key){return typeof(this._hash[key])!="undefined";};
this.clear=function (){for(var k in this._hash){delete this._hash[k];};};

};

this._caseSensitive=true;


this.str2hashtable=function (key,cs){

var _key=key.split(/,/g);
var _hash=new Hashtable();
var _cs=true;


if(typeof(cs)=="undefined"||cs==null){
_cs=this._caseSensitive;
};else {
_cs=cs;
};

for(var i in _key){
if(_cs){
_hash.add(_key[i]);
};else {
_hash.add((_key[i]+"").toLowerCase());
};

};
return _hash;
};


this._codetxt=code;

if(typeof(syntax)=="undefined"){
syntax="";
};

this._deleteComment=false;

this._caseSensitive=true;

this._blockElement=this.str2hashtable("switch,if,while,try,finally");

this._function=this.str2hashtable("function");

this._isFor="for";

this._choiceElement=this.str2hashtable("else,catch");

this._beginBlock="{";
this._endBlock="}";

this._singleEyeElement=this.str2hashtable("var,new,return,else,delete,in,case");

this._wordDelimiters="�� ,.?!;:\\/<>(){}[]\"'\r\r\n\t=+-|*%@#$^&";

this._quotation=this.str2hashtable("\",'");

this._lineComment="//";

this._escape="\\";

this._commentOn="/*";

this._commentOff="*/";

this._rowEnd=";";

this._in="in";


this.isCompress=false;
this.style=0;

this._tabNum=0;


this.format=function (){
var codeArr=new Array();
var word_index=0;
var htmlTxt=new Array();

if(this.isCompress){
this._deleteComment=true;
};



for(var i=0;i<this._codetxt.length;i++){
if(this._wordDelimiters.indexOf(this._codetxt.charAt(i))==-1){
if(codeArr[word_index]==null||typeof(codeArr[word_index])=='undefined'){
codeArr[word_index]="";
};
codeArr[word_index]+=this._codetxt.charAt(i);
};else {
if(typeof(codeArr[word_index])!='undefined'&&codeArr[word_index].length>0)
word_index++;
codeArr[word_index++]=this._codetxt.charAt(i);
};
};


var quote_opened=false;
var slash_star_comment_opened=false;
var slash_slash_comment_opened=false;
var line_num=1;
var quote_char="";

var function_opened=false;

var bracket_open=false;
var for_open=false;


for(var i=0;i<=word_index;i++){

if(typeof(codeArr[i])=="undefined"||codeArr[i].length==0){
continue;
};else if(codeArr[i]==" "||codeArr[i]=="\t"){
if(slash_slash_comment_opened||slash_star_comment_opened){
if(!this._deleteComment){
htmlTxt[htmlTxt.length]=codeArr[i];
};
};
if(quote_opened){
htmlTxt[htmlTxt.length]=codeArr[i];
};
};else if(codeArr[i]=="\r\n"){

};else if(codeArr[i]=="\r"){
slash_slash_comment_opened=false;
quote_opened=false;
line_num++;
if(!this.isCompress){
htmlTxt[htmlTxt.length]="\r"+this.getIdent();
};

};else if(!slash_slash_comment_opened&&!slash_star_comment_opened&&!quote_opened&&this.isFunction(codeArr[i])){
htmlTxt[htmlTxt.length]=codeArr[i]+" ";
function_opened=true;
};else if(!slash_slash_comment_opened&&!slash_star_comment_opened&&!quote_opened&&codeArr[i]==this._isFor){
htmlTxt[htmlTxt.length]=codeArr[i];
for_open=true;
};else if(!slash_slash_comment_opened&&!slash_star_comment_opened&&!quote_opened&&codeArr[i]=="("){
bracket_open=true;
htmlTxt[htmlTxt.length]=codeArr[i];
};else if(!slash_slash_comment_opened&&!slash_star_comment_opened&&!quote_opened&&codeArr[i]==")"){
bracket_open=false;
htmlTxt[htmlTxt.length]=codeArr[i];
};else if(!slash_slash_comment_opened&&!slash_star_comment_opened&&!quote_opened&&codeArr[i]==this._rowEnd){
if(!this.isCompress){
if(!for_open){
if(i<word_index&&(codeArr[i+1]!="\r"&&codeArr[i+1]!="\r\n")){
htmlTxt[htmlTxt.length]=codeArr[i]+"\r\n"+this.getIdent();
};else {
htmlTxt[htmlTxt.length]=codeArr[i]+this.getIdent();
};
};else {
htmlTxt[htmlTxt.length]=codeArr[i];
};
};else {
htmlTxt[htmlTxt.length]=codeArr[i];
};
};else if(!slash_slash_comment_opened&&!slash_star_comment_opened&&!quote_opened&&codeArr[i]==this._beginBlock){
for_open=false;
if(!this.isCompress){
switch(this.style){
case 0:
this._tabNum++;
htmlTxt[htmlTxt.length]=codeArr[i]+"\r\n"+this.getIdent();
break;
case 1:
htmlTxt[htmlTxt.length]="\r\n"+this.getIdent();
this._tabNum++;
htmlTxt[htmlTxt.length]=codeArr[i]+"\r\n"+this.getIdent();
break;
default:
this._tabNum++;
htmlTxt[htmlTxt.length]=codeArr[i];
break;

};
};else {
htmlTxt[htmlTxt.length]=codeArr[i];
};

};else if(!slash_slash_comment_opened&&!slash_star_comment_opened&&!quote_opened&&codeArr[i]==this._endBlock){
if(!this.isCompress){
this._tabNum--;
if(i<word_index&&codeArr[i+1]!=this._rowEnd){
htmlTxt[htmlTxt.length]="\r\n"+this.getIdent()+codeArr[i];
};else {
htmlTxt[htmlTxt.length]="\r\n"+this.getIdent()+codeArr[i];
};
};else {
if(i<word_index&&codeArr[i+1]!=this._rowEnd){
htmlTxt[htmlTxt.length]=codeArr[i]+this._rowEnd;
};else {
htmlTxt[htmlTxt.length]=codeArr[i];
};
};

};else if(!slash_slash_comment_opened&&!slash_star_comment_opened&&!quote_opened&&this.isBlockElement(codeArr[i])){
htmlTxt[htmlTxt.length]=codeArr[i];

};else if(!slash_slash_comment_opened&&!slash_star_comment_opened&&!quote_opened&&this.isSingleEyeElement(codeArr[i])){
if(codeArr[i]==this._in){
htmlTxt[htmlTxt.length]=" ";
};
htmlTxt[htmlTxt.length]=codeArr[i]+" ";

};else if(!slash_star_comment_opened&&!slash_slash_comment_opened&&this._quotation.contains(codeArr[i])){
if(quote_opened){

if(quote_char==codeArr[i]){
htmlTxt[htmlTxt.length]=codeArr[i];
quote_opened=false;
quote_char="";
};else {
htmlTxt[htmlTxt.length]=codeArr[i];
};
};else {
htmlTxt[htmlTxt.length]=codeArr[i];
quote_opened=true;
quote_char=codeArr[i];
};

};else if(codeArr[i]==this._escape){
htmlTxt[htmlTxt.length]=codeArr[i];
if(i<word_index-1){
if(codeArr[i+1].charCodeAt(0)>=32&&codeArr[i+1].charCodeAt(0)<=127){
htmlTxt[htmlTxt.length]=codeArr[i+1].substr(0,1);
htmlTxt[htmlTxt.length]=codeArr[i+1].substr(1);
i=i+1;
};
};

};else if(!slash_slash_comment_opened&&!slash_star_comment_opened&&!quote_opened&&this.isStartWith(this._commentOn,codeArr,i)){
slash_star_comment_opened=true;
if(!this._deleteComment){
htmlTxt[htmlTxt.length]=this._commentOn;
};
i=i+this.getSkipLength(this._commentOn);

};else if(!slash_slash_comment_opened&&!slash_star_comment_opened&&!quote_opened&&this.isStartWith(this._lineComment,codeArr,i)){
slash_slash_comment_opened=true;
if(!this._deleteComment){
htmlTxt[htmlTxt.length]=this._lineComment;
};
i=i+this.getSkipLength(this._lineComment);

};else if(!slash_slash_comment_opened&&!slash_star_comment_opened&&!quote_opened&&this.isStartWith(this._ignore,codeArr,i)){
slash_slash_comment_opened=true;
htmlTxt[htmlTxt.length]=this._ignore;
i=i+this.getSkipLength(this._ignore);

};else if(!quote_opened&&!slash_slash_comment_opened&&this.isStartWith(this._commentOff,codeArr,i)){
if(slash_star_comment_opened){
slash_star_comment_opened=false;
if(!this._deleteComment){
htmlTxt[htmlTxt.length]=this._commentOff;
};
i=i+this.getSkipLength(this._commentOff);
};
};else {

if(!quote_opened){

if(!slash_slash_comment_opened&&!slash_star_comment_opened){
htmlTxt[htmlTxt.length]=codeArr[i];

};else {
if(!this._deleteComment){
htmlTxt[htmlTxt.length]=codeArr[i];
};
};
};else {
htmlTxt[htmlTxt.length]=codeArr[i];
};
};

};

return htmlTxt.join("");
};

this.isStartWith=function (str,code,index){

if(typeof(str)!="undefined"&&str.length>0){
var cc=new Array();
for(var i=index;i<index+str.length;i++){
cc[cc.length]=code[i];
};
var c=cc.join("");
if(this._caseSensitive){
if(str.length>=code[index].length&&c.indexOf(str)==0){
return true;
};
};else {
if(str.length>=code[index].length&&c.toLowerCase().indexOf(str.toLowerCase())==0){
return true;
};
};
return false;

};else {
return false;
};
};

this.isFunction=function (val){
return this._function.contains(this._caseSensitive?val:val.toLowerCase());
};

this.isBlockElement=function (val){
return this._blockElement.contains(this._caseSensitive?val:val.toLowerCase());
};

this.isChoiceElement=function (val){
return this._choiceElement.contains(this._caseSensitive?val:val.toLowerCase());
};

this.isSingleEyeElement=function (val){
return this._singleEyeElement.contains(this._caseSensitive?val:val.toLowerCase());
};

this.isNextElement=function (from,word){
for(var i=from;i<word.length;i++){
if(word[i]!=" "&&word[i]!="\t"&&word[i]!="\r"&&word[i]!="\r\n"){
return this.isChoiceElement(word[i]);
};
};
return false;
};

this.getSkipLength=function (val){
var count=0;
for(var i=0;i<val.length;i++){
if(this._wordDelimiters.indexOf(val.charAt(i))>=0){
count++;
};
};
if(count>0){
count=count-1;
};
return count;
};

this.getIdent=function (){
var n=[];
for(var i=0;i<this._tabNum;i++){
n[n.length]="\t";
};
return n.join("");
};
};

function doformat(o){
var htmltxt="";

if(o==null){
alert("domNode is null!");
return ;
};

var _codetxt="";

if(typeof(o)=="object"){
switch(o.tagName){
case "TEXTAREA":
case "INPUT":
_codetxt=o.value;
break;
case "DIV":
case "SPAN":
_codetxt=o.innerText;
break;
default:
_codetxt=o.innerHTML;
break;
};
};else {
_codetxt=o;
};

var _syn=new CLASS_FORMAT(_codetxt);
htmltxt=_syn.format();
return htmltxt;
};


function go(code,type,value)
{
var xx=new CLASS_FORMAT(code);
var a=new Date();

if(type==1){
xx.isCompress=true;
};else {
xx.style=value;
};
return xx.format();
};
 t   U�� U��ת�����ֱ����to16��tohtml K  function to16on(str){
    var a = [],i = 0;
    for (; 
    i < str.length ;
    ) a[i] = ("00" + str.charCodeAt(i ++).toString(16)).slice(-4);
    return "\\u" + a.join("\\u");
}
function to16un(str) {
    return unescape(str.replace(/\\/g, "%"));
}
function tohtmlon(str){
    var a = [], i = 0;
    for (; 
    i < str.length ;
    ) a[i] = str.charCodeAt(i ++);
    return "&#" + a.join(";&#") + ";";
}
function tohtmlun(str){
    return str.replace(/&#(x)?([^&]{1,5});?/g, function (a, b, c) {
        return String.fromCharCode(parseInt(c,b?16:10));
    });
} �   ��Ѷ_md5 md5(md5_3(QQ����)+��д��֤��) U  var hexcase=1;
var b64pad="";
var chrsz=8;
var mode=32;
function md5_3(B){
    var A=new Array;
    A=core_md5(str2binl(B),B.length*chrsz);
    A=core_md5(A,16*chrsz);
    A=core_md5(A,16*chrsz);
    return binl2hex(A)
}
function md5(A){
    return hex_md5(A)
}
function hex_md5(A){
    return binl2hex(core_md5(str2binl(A),A.length*chrsz))
}
function str_md5(A){
    return binl2str(core_md5(str2binl(A),A.length*chrsz))
}
function hex_hmac_md5(A,B){
    return binl2hex(core_hmac_md5(A,B))
}
function b64_hmac_md5(A,B){
    return binl2b64(core_hmac_md5(A,B))
}
function str_hmac_md5(A,B){
    return binl2str(core_hmac_md5(A,B))
}
function core_md5(K,F){
    K[F>>5]|=128<<((F)%32);
    K[(((F+64)>>>9)<<4)+14]=F;
    var J=1732584193;
    var I=-271733879;
    var H=-1732584194;
    var G=271733878;
    for(var C=0;
    C<K.length;
    C+=16){
        var E=J;
        var D=I;
        var B=H;
        var A=G;
        J=md5_ff(J,I,H,G,K[C+0],7,-680876936);
        G=md5_ff(G,J,I,H,K[C+1],12,-389564586);
        H=md5_ff(H,G,J,I,K[C+2],17,606105819);
        I=md5_ff(I,H,G,J,K[C+3],22,-1044525330);
        J=md5_ff(J,I,H,G,K[C+4],7,-176418897);
        G=md5_ff(G,J,I,H,K[C+5],12,1200080426);
        H=md5_ff(H,G,J,I,K[C+6],17,-1473231341);
        I=md5_ff(I,H,G,J,K[C+7],22,-45705983);
        J=md5_ff(J,I,H,G,K[C+8],7,1770035416);
        G=md5_ff(G,J,I,H,K[C+9],12,-1958414417);
        H=md5_ff(H,G,J,I,K[C+10],17,-42063);
        I=md5_ff(I,H,G,J,K[C+11],22,-1990404162);
        J=md5_ff(J,I,H,G,K[C+12],7,1804603682);
        G=md5_ff(G,J,I,H,K[C+13],12,-40341101);
        H=md5_ff(H,G,J,I,K[C+14],17,-1502002290);
        I=md5_ff(I,H,G,J,K[C+15],22,1236535329);
        J=md5_gg(J,I,H,G,K[C+1],5,-165796510);
        G=md5_gg(G,J,I,H,K[C+6],9,-1069501632);
        H=md5_gg(H,G,J,I,K[C+11],14,643717713);
        I=md5_gg(I,H,G,J,K[C+0],20,-373897302);
        J=md5_gg(J,I,H,G,K[C+5],5,-701558691);
        G=md5_gg(G,J,I,H,K[C+10],9,38016083);
        H=md5_gg(H,G,J,I,K[C+15],14,-660478335);
        I=md5_gg(I,H,G,J,K[C+4],20,-405537848);
        J=md5_gg(J,I,H,G,K[C+9],5,568446438);
        G=md5_gg(G,J,I,H,K[C+14],9,-1019803690);
        H=md5_gg(H,G,J,I,K[C+3],14,-187363961);
        I=md5_gg(I,H,G,J,K[C+8],20,1163531501);
        J=md5_gg(J,I,H,G,K[C+13],5,-1444681467);
        G=md5_gg(G,J,I,H,K[C+2],9,-51403784);
        H=md5_gg(H,G,J,I,K[C+7],14,1735328473);
        I=md5_gg(I,H,G,J,K[C+12],20,-1926607734);
        J=md5_hh(J,I,H,G,K[C+5],4,-378558);
        G=md5_hh(G,J,I,H,K[C+8],11,-2022574463);
        H=md5_hh(H,G,J,I,K[C+11],16,1839030562);
        I=md5_hh(I,H,G,J,K[C+14],23,-35309556);
        J=md5_hh(J,I,H,G,K[C+1],4,-1530992060);
        G=md5_hh(G,J,I,H,K[C+4],11,1272893353);
        H=md5_hh(H,G,J,I,K[C+7],16,-155497632);
        I=md5_hh(I,H,G,J,K[C+10],23,-1094730640);
        J=md5_hh(J,I,H,G,K[C+13],4,681279174);
        G=md5_hh(G,J,I,H,K[C+0],11,-358537222);
        H=md5_hh(H,G,J,I,K[C+3],16,-722521979);
        I=md5_hh(I,H,G,J,K[C+6],23,76029189);
        J=md5_hh(J,I,H,G,K[C+9],4,-640364487);
        G=md5_hh(G,J,I,H,K[C+12],11,-421815835);
        H=md5_hh(H,G,J,I,K[C+15],16,530742520);
        I=md5_hh(I,H,G,J,K[C+2],23,-995338651);
        J=md5_ii(J,I,H,G,K[C+0],6,-198630844);
        G=md5_ii(G,J,I,H,K[C+7],10,1126891415);
        H=md5_ii(H,G,J,I,K[C+14],15,-1416354905);
        I=md5_ii(I,H,G,J,K[C+5],21,-57434055);
        J=md5_ii(J,I,H,G,K[C+12],6,1700485571);
        G=md5_ii(G,J,I,H,K[C+3],10,-1894986606);
        H=md5_ii(H,G,J,I,K[C+10],15,-1051523);
        I=md5_ii(I,H,G,J,K[C+1],21,-2054922799);
        J=md5_ii(J,I,H,G,K[C+8],6,1873313359);
        G=md5_ii(G,J,I,H,K[C+15],10,-30611744);
        H=md5_ii(H,G,J,I,K[C+6],15,-1560198380);
        I=md5_ii(I,H,G,J,K[C+13],21,1309151649);
        J=md5_ii(J,I,H,G,K[C+4],6,-145523070);
        G=md5_ii(G,J,I,H,K[C+11],10,-1120210379);
        H=md5_ii(H,G,J,I,K[C+2],15,718787259);
        I=md5_ii(I,H,G,J,K[C+9],21,-343485551);
        J=safe_add(J,E);
        I=safe_add(I,D);
        H=safe_add(H,B);
        G=safe_add(G,A)
    }
    if(mode==16){
        return Array(I,H)
    }
    else{
        return Array(J,I,H,G)
    }
    
}
function md5_cmn(F,C,B,A,E,D){
    return safe_add(bit_rol(safe_add(safe_add(C,F),safe_add(A,D)),E),B)
}
function md5_ff(C,B,G,F,A,E,D){
    return md5_cmn((B&G)|((~B)&F),C,B,A,E,D)
}
function md5_gg(C,B,G,F,A,E,D){
    return md5_cmn((B&F)|(G&(~F)),C,B,A,E,D)
}
function md5_hh(C,B,G,F,A,E,D){
    return md5_cmn(B^G^F,C,B,A,E,D)
}
function md5_ii(C,B,G,F,A,E,D){
    return md5_cmn(G^(B|(~F)),C,B,A,E,D)
}
function core_hmac_md5(C,F){
    var E=str2binl(C);
    if(E.length>16){
        E=core_md5(E,C.length*chrsz)
    }
    var A=Array(16),D=Array(16);
    for(var B=0;
    B<16;
    B++){
        A[B]=E[B]^909522486;
        D[B]=E[B]^1549556828
    }
    var G=core_md5(A.concat(str2binl(F)),512+F.length*chrsz);
    return core_md5(D.concat(G),512+128)
}
function safe_add(A,D){
    var C=(A&65535)+(D&65535);
    var B=(A>>16)+(D>>16)+(C>>16);
    return(B<<16)|(C&65535)
}
function bit_rol(A,B){
    return(A<<B)|(A>>>(32-B))
}
function str2binl(D){
    var C=Array();
    var A=(1<<chrsz)-1;
    for(var B=0;
    B<D.length*chrsz;
    B+=chrsz){
        C[B>>5]|=(D.charCodeAt(B/chrsz)&A)<<(B%32)
    }
    return C
}
function binl2str(C){
    var D="";
    var A=(1<<chrsz)-1;
    for(var B=0;
    B<C.length*32;
    B+=chrsz){
        D+=String.fromCharCode((C[B>>5]>>>(B%32))&A)
    }
    return D
}
function binl2hex(C){
    var B=hexcase?"0123456789ABCDEF":"0123456789abcdef";
    var D="";
    for(var A=0;
    A<C.length*4;
    A++){
        D+=B.charAt((C[A>>2]>>((A%4)*8+4))&15)+B.charAt((C[A>>2]>>((A%4)*8))&15)
    }
    return D
}
function binl2b64(D){
    var C="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
    var F="";
    for(var B=0;
    B<D.length*4;
    B+=3){
        var E=(((D[B>>2]>>8*(B%4))&255)<<16)|(((D[B+1>>2]>>8*((B+1)%4))&255)<<8)|((D[B+2>>2]>>8*((B+2)%4))&255);
        for(var A=0;
        A<4;
        A++){
            if(B*8+A*6>D.length*32){
                F+=b64pad
            }
            else{
                F+=C.charAt((E>>6*(3-A))&63)
            }
            
        }
        
    }
    return F
} �    ��Ѷ_QQ�ռ�gtk getGTK(skey) �   function getGTK(str){
   var hash = 5381;
   for(var i = 0, len = str.length; i < len; ++i)
   {
   hash += (hash << 5) + str.charAt(i).charCodeAt();
   }
   return hash & 0x7fffffff;
}     s�*�,s ������s s s s s s          rj��W                                          �` ?�   �      1    S  9   krnlnd09f2340818511d396f6aaf844c7e32550ϵͳ����֧�ֿ�                0   
 	q4Ir4Is4	�`0�   �  P� �U� 0I� 0%�  R       ���ڳ���1       1a2T`2                   ����       2;H�`�`�`            ����   ������        M4N4O4P4Q4R4S4T4            ����   �ű���       U4V4W4X4Y4Z4                   __HIDDEN_TEMP_MOD__    X   [4\4]4^4_4`4a4b4c4d4e4f4g4h4i4j4k4l4m4n4o4p4        �`R       ���ڳ���2       �`�`�`        �  12;HT`2a2M4N4O4P4Q4R4S4T4U4V4W4X4Y4Z4[4\4]4^4_4`4a4b4c4d4e4f4g4h4i4j4k4l4m4n4o4p4�`�`�`�`�`�` � � � �7�  7� �>� �=� �<� �;� ;� �x� �w� �v�  v�  u� @t� `s� �r� �q� �p�  �� @�� `�� ��� ��� ��� ���  ��  �� @�� `�� ��� ��� ��� ���  ��  �� @��  �� @�� `�� ��� ��� ��� ���  ��  �� @�� `�� 01� 
            _�༭��2_��ý���                                      $           E   jw4
��          6                a2                        	8     �
   ��֤��֤��
   ������֤��   8   8%A%            �   �����ı�       �   ��֤��        3%         �   QQ��         �   �          �      �      �   �        j   �         j4               688%7!n4��          6!               6(   http://check.ptlogin2.qq.com/check?uin= 83%7   &appid=1003903&r=0. !;��          68h7j4               68A%7!f4��          688%7   ','    ', ' j               68A%7	8     �   ȡ16λ�����          >%         �   �����                    1   �   �   	       �          C   \   �       �   p               6      0@j$               6j4               68>%7!               68>%7!Z               6!%               6              "@Uq               6j               68>%7	8     �
   ��ȡ��֤��   �����ֽڼ���֤��      O%         �   ͼƬ     7   I%Q%            �   QQ��       �   ��֤��KEY         �             s      �      �   �   �       �   j4               68O%7!m4��          6!               61   http://captcha.qq.com/getimage?aid=1003903&r=0.  !;��          6   &uin= 8I%7
   &vc_type= 8Q%78h7j               68O%7
            _��ť1_������       �   U%[%^%c%�H%       &   :   K        �   �����ı�       �   ��ַ     r4I   MD5�ű�       �   ����       �   �ύ����          x          j   �   Y  �  �    D    %  ,  >  E  Z  c  �  �  �  �  �  5  t  �  �  �    <  Q  ~     �  }  �  ;  $   6       �   r  ,  |  �    N  �   /   6   X       |   �   �   �   �   2  K  d  k  �  �  �  %  >  u  �  �  �    Y  �  �    b  i  p  �    G  `  �  �  �  �        g  �  jW4��          8^%7�4j4               68c%7!X4��          8^%7   md5_3 8 9	     7j4               68c%7!X4��          8^%7   md5 !               68c%7!T               68 9	     7j4               68[%7!               6    http://ptlogin2.qq.com/login?u= 8 9	     7   &p= 8c%7   &verifycode= 8 9	     7�   &webqq_type=10&remember_uin=1&login2qq=1&aid=1003903&u1=http%3A%2F%2Fweb.qq.com%2Floginproxy.html%3Flogin2qq%3D1%26webqq_type%3D10&h=1&ptredirect=0&ptlang=2052&from_ui=1&pttype=1&dumy=&fp=loginerroralert&mibao_css=m_webqq j4               68U%7!n4��          68[%7   GET 8h7j    ��          6mn               6!'               6!R               68U%7	   ��¼�ɹ�         �j    ��      $   http://d.web2.qq.com/channel/login2 6j    ��      �   r=%7B%22status%22%3A%22online%22%2C%22ptwebqq%22%3A%22ptwebqq%22%2C%22passwd_sig%22%3A%22%22%2C%22clientid%22%3A%224996437%22%2C%22psessionid%22%3Anull%7D&clientid=4996437&psessionid=null 6j4              68�`7!f4��         68U%7   '��¼�ɹ���', '    ' j4               68�`7!f4��          68h7	   ptwebqq=    ; j4               68�`7!f4��          68h7   skey=    ; j4               68�H%7!               67   r=%7B%22status%22%3A%22callme%22%2C%22ptwebqq%22%3A%22 8�`77   %22%2C%22passwd_sig%22%3A%22%22%2C%22clientid%22%3A%22 8�[7+   %22%2C%22psessionid%22%3Anull%7D&clientid= 8�[7   &psessionid=null j4               68U%7!Z               6!n4��          6$   http://d.web2.qq.com/channel/login2    POST 8�H%78h78�`79   http://d.web2.qq.com/proxy.html?v=20110331002&callback=2 j�               68U%7mn               6!'               6!R               68U%7   vfwebqq         �j4               68�`7!f4��          68U%7�`  j4               68�`78 9	     7j�               6	   ��¼�ɹ�         j�               68�`R7  j4               68  9    R7  Soj�               6	   ��¼ʧ��         Ttj    ��          6Soj�               6	   ��¼ʧ��         Ttj    ��          6
 0     �   _ͼƬ��1_���������ſ�               Y   ]2%^2%_2%       *       �   ����λ��      �   ����λ��      �   ���ܼ�״̬                               j1��          6
 0          ȡ��֤��          b2%         �   ��֤��          <          4   m   �   �       P  �  �    )  x  �     4   �     �  �  w     i  K  4   �   �   8  b  {  �  �  �    ;  ]  m  &       �  j$               6j4               68�[7    p               6!%               6      @       @j$               6j4               68�[7!               68�[7!Z               6!%               6              "@Uq               6j    ��          6l               6!'               68 9	     7    j4               68b2%7!2��          68 9	     7mn               6!&               6!L               68b2%7      @j4               68 9	     78b2%7j4               68 9     7��Soj4               68	 9     7!H��          68 9	     78b2%7Ttj    ��          6Rsj    ��          6q4I�     �   ����J   ����ָ�����������ʽ�ı�����һ���������ʽ���󡣱������е�ԭ�����ݽ����ͷ�           [  �4%�4%�4%�4%�4%    ;   T   �     7     �   �������ʽ�ı� ���硰������4\.0(ģ��|֧�ֿ�)?��      �   ���������ı�  �     �  �Ƿ����ִ�Сд ��������,Ĭ��Ϊ��,�����ִ�Сд; ��Ϊ���ִ�Сд;������ָ������������ʽ�ڴ����ɹ������ƥ�䡢�������滻ʱ���Ƿ����ִ�Сд; -    �  �Ƿ�ƥ����� ��������,Ĭ��Ϊ��,����ƥ�����; �������ԱֵΪ�棬�ַ���^������ƥ��Ŀ���ı��Ŀ�ͷ������ƥ��Ŀ���ı��л��з����ַ�(10)���ַ�(13)�� #���з����ĺ��棻�ַ���$������ƥ��Ŀ���ı��Ľ�β������ƥ��Ŀ���ı��л��з���ǰ�档�����ַ���^������ƥ��Ŀ���ı��Ŀ�ͷ����$��Ҳ����ƥ��Ŀ���ı��Ľ�β��      �  �Ƿ�ȫ��ƥ��                            j    ��          6q4I�          �鿴                                              j    ��          6q4I�     �
   ȡ�����ı�Z   �������ı���ʽ��ʾ���������ʽ������ö�����δ�������򷵻ؿ��ı���������Ϊ�߼������Ա����                                          j    ��          6q4I�     �   �滻    �滻���������ʽ�������ҵ����ı�           1   �4%    %     �  �����滻���ı� �����滻���ı�                           j    ��          6q4I�    �
   ȡƥ������   ȡ��������ƥ�䵽������                                          j    ��          6q4I�     �
   ȡƥ���ı�   ȡ��������ƥ�䵽���ı�           �   �4%�4%    "       �   ƥ������ ����ֵ��1��ʼ }    �  ��ʼλ�� ���Ա�ʡ�ԣ��ṩ��������ʱֻ���ṩ��������������óɹ��󣬱��������ȡ�õ����ı��������������ı��е���ʼλ��                           j    ��          6q4I�     �   ȡ��ƥ���ı�    ȡ����������ӱ���ʽƥ�䵽���ı�           ,  �4%�4%�4%    "   �       �   ƥ������ ����ֵ��1��ʼ m    �   �ӱ���ʽ���� ��ȡ��ֵ���ӱ���ʽ,�ò�����Ӧ���������ʽ�е�һ���ӱ���ʽ��Բ����"( )"Ϊ���,������1��ʼ }    �  ��ʼλ�� ���Ա�ʡ�ԣ��ṩ��������ʱֻ���ṩ��������������óɹ��󣬱��������ȡ�õ����ı��������������ı��е���ʼλ��                           j    ��          6q4I�    �   ȡ��ƥ������    ȡ����������ӱ���ʽƥ�䵽������                                          j    ��          6r4I�     �   ������               <   �4%    0     �  �ű����� JScript,VBScript ������ȡ������                           j    ��          6r4I�   1  
   �������ʽ                  �4%         �   ����ʽ                            j    ��          6r4I�    �   ִ�����                  �4%         �   ���                            j    ��          6r4I�     �   ����               �   �4%�4%�4%�4%�4%�4%       %   7   I   [        �   ������       �  ����1       �  ����2       �  ����3       �  ����4       �  ����5                            j    ��          6r4I�     �   ����1               �   �4%�4%�4%�4%�4%�4%       %   7   I   [        �   ������       �  ����1      �  ����2      �  ����3       �  ����4       �  ����5                            j    ��          6r4I�    �   ���ýű�                                              j    ��          6s4	�     �   ת��ΪGMT��ʽ   ������ʱ��������ת��ΪGMT��ʽ              �4%         �   ��ת��ʱ��                            j    ��          6s4	�     �
   ȡ�м��ı�               �   �4%�4%�4%�4%�4%�4%�4%       .   D   Z   o   �        �   ��ȡ����      �  ��ʼ����λ��       �   ��ʼ�ı�1       �  ��ʼ�ı�2       �   �����ı�       �  �����ִ�Сд Ĭ����      �  �Ƿ������ʼ�ı� Ĭ����                           j    ��          6s4	�     �   COOKIE�ϲ�����   ���ظ��º��COOKIE           <   �4%�4%            �  ԭCOOKIE       �   ����COOKIE                            j    ��          6s4	�          ��COOKIE   �趨ǰ���������           8   �4%�4%            �   ��ַ       �   COOKIE����                            j    ��          6s4	�     �   ȡCOOKIE               J   �4%�4%            �   ��ַ  %     �  COOKIE���� Ϊ�շ���ȫ��COOKIE                           j    ��          6s4	�     �   ȡ����               8   �4%�4%            �   ��ַ       �  �����˶˿�                            j    ��          6s4	�     �   ���COOKIE�ļ�               o   �4%�4%    :   6     �  �ؼ��� ����cookie�ļ��Ĺؼ��ּ���,�������ȫ�� !     �  COOKIE·�� ����COOKIE·��                           j    ��          6s4	�     �	   ����ת��1               �   �4%�4%�4%�4%       D   q        �   ��ת������  )     �   ת��ǰ���� utf-8��unicode��GBK �� )     �   ת������� utf-8��unicode��GBK �� X    �  ת�������ݿ�ʼλ�� λ�ô�0��ʼ��unicode�����ʶռ2���ֽڣ�utf-8�����ʶռ3���ֽ�                           j    ��          6s4	�     �   URL����                  �4%         �   URL                            j    ��          6s4	�     �   URL����                  �4%         �   URL                            j    ��          6s4	�     �   �߼���ȡ�ı�               �  �4%�4%�4%�4%�4%�4%�4%�4%       *   ?   v   �   �          �   ��������       �   ����ı�       �   �ұ��ı�  3    �  ��ʼλ�� ��ָ����ʼѰ�ҵ�λ�ã�Ϊ����ָ�� /    �  �ı����� ��һ�������������ҵ����ı����� 9    �  ��󳤶� ָ�����ص��ı�����󳤶ȡ�Ϊ���򷵻�ȫ�� +    �  ����λ�� ��һ�������������ҵ���λ�� N     �  �������� �Ƿ�ֻ���� ���Ȳ����� ��󳤶� ���ı�����������򷵻ؿ��ı���                           j    ��          6s4	�     �   ȡ�ı��м�1               t   �4%�4%�4%�4%       (   ?        �   �ı�       �   ��ߵ��ı�       �   �ұߵ��ı�      �  ��ʼλ��                            j    ��          6s4	�     �   getTime                                              j    ��          6s4	�     �   GZIPѹ��                  �4%         �   inData                            j    ��          6s4	�     �   GZIP��ѹ                  �4%         �   inData                            j    ��          6s4	�     �   ȥ���ı�                  �4%�4%�4%�4%�4%�4%�4%�4%�4%�4%�4%       %   7   I   [   m      �   �   �        �   ԭ�ı�       �   ȥ��1       �  ȥ��2       �  ȥ��3       �  ȥ��4       �  ȥ��5       �  ȥ��6       �  ȥ��7       �  ȥ��8       �  ȥ��9       �  ȥ��10                            j    ��          6s4	�     �   JS������               �   �4%�4%�4%    &   o   "     �   js���� ��Ҫ����\���ܵ�Դ�� E    �  ѹ��ģʽ 0Ϊ��ʽ������,1Ϊѹ������. ע:���Ϊ1,�����������Ч @    �  �ָ�� 0Ϊ����js����ָ��,1Ϊ΢����׼js����ָ��                           j    ��          6s4	�     �	   U����ת��   Ĭ��ת������Ϊto16un           [   �4%�4%            �   Ҫת���ı�  0     �  ת������ to16on to16un tohtmlon tohtmlun                           j    ��          6s4	�     �
   HTTP����ҳ$   ������ʱ�����ؿգ�������֧�ֶ��߳�           �  �4%�4%�4%�4%�4%�4%�4%�4%�4%�4%�4%�4%�4%�4%       Q   p   �   �     /  X  u  �  �  �  �       �   ��ַ ��������ҳ��ַ .     �  ���ʷ�ʽ "GET" or "POST",Ϊ��Ĭ��"GET"      �  �ύ��Ϣ "POST"ר�� K     �  �ύCookies �ύ��Cookie ע�����������ݱ���ʱ���Զ��ش����ص�Cookie       �  ����Cookies ���ص�Cookie )     �  ����Э��ͷ һ��һ�����û��з�����      �  ����Э��ͷ Location %     �  ��ֹ�ض��� ��ֹ��ҳ�����ض���      �  ������ַ ������ַ      �  �û��� �����û���      �  ���� �������� &    �  ��ʱ ��|Ĭ��Ϊ15��,1Ϊ���޵ȴ� #     �  ����Э��ͷ ����������Э��ͷ !     �  �ֽڼ��ύ �ύ�ֽڼ�����                           j    ��          6s4	�     �   HTTP����ҳu   ����ר�ã��Զ�����UTF8����           �  �4%�4%�4%�4%�4%�4% 5%5%5%5%5%5%5%5%       Q   p   �   �     /  X  u  �  �  �  �       �   ��ַ ��������ҳ��ַ .     �  ���ʷ�ʽ "GET" or "POST",Ϊ��Ĭ��"GET"      �  �ύ��Ϣ "POST"ר�� K     �  �ύCookies �ύ��Cookie ע�����������ݱ���ʱ���Զ��ش����ص�Cookie       �  ����Cookies ���ص�Cookie )     �  ����Э��ͷ һ��һ�����û��з�����      �  ����Э��ͷ Location %     �  ��ֹ�ض��� ��ֹ��ҳ�����ض���      �  ������ַ ������ַ      �  �û��� �����û���      �  ���� �������� &    �  ��ʱ ��|Ĭ��Ϊ15��,1Ϊ���޵ȴ� #     �  ����Э��ͷ ����������Э��ͷ !     �  �ֽڼ��ύ �ύ�ֽڼ�����                           j    ��          6s4	�     �   HTTP����ҳs   ����ר�ã��Զ������ı�           �  5%	5%
5%5%5%5%5%5%5%5%5%5%5%5%       Q   p   �   �     /  X  u  �  �  �  �       �   ��ַ ��������ҳ��ַ .     �  ���ʷ�ʽ "GET" or "POST",Ϊ��Ĭ��"GET"      �  �ύ��Ϣ "POST"ר�� K     �  �ύCookies �ύ��Cookie ע�����������ݱ���ʱ���Զ��ش����ص�Cookie       �  ����Cookies ���ص�Cookie )     �  ����Э��ͷ һ��һ�����û��з�����      �  ����Э��ͷ Location %     �  ��ֹ�ض��� ��ֹ��ҳ�����ض���      �  ������ַ ������ַ      �  �û��� �����û���      �  ���� �������� &    �  ��ʱ ��|Ĭ��Ϊ15��,1Ϊ���޵ȴ� #     �  ����Э��ͷ ����������Э��ͷ !     �  �ֽڼ��ύ �ύ�ֽڼ�����                           j    ��          6s4	�     �   random   ���ؽ��� 0 �� 1 ֮���α�����                                          j    ��          6	8     �   ȡʱ���6   ��ʱ������ֵת�������͵ı�׼UNIXʹ�õĸ�������ʱ�����   F   �`%�`%            �   ��ʼʱ��       �   ʱ��ֵ Ҫת����ʱ��ֵ                -   s   �                 ?   �   �       '  j4               68�`%7!�               6j4               68�`%7!X               6   1970-01-01 08:00:00 j$               6j               6!Z               6!               6!               6!x               68�`%78�`%7 S      @�@!%               6             8�@	0          ��ȡͷ��                           �   �  �         �   �     �   b  x      �  j    ��      �   http://face2.qun.qq.com/cgi/svr/face/getface?cache=1&type=1&fid=0&uin=QQ��&vfwebqq=60114f70c1ae7082d05a61221dc7eaefdb5dc18a0b277d69a8578611e55eea7aa8a3339949e645cd&t=1336888692062 6j4               68�`R9�`�`R9     7!m4��          6!               6G   http://face2.qun.qq.com/cgi/svr/face/getface?cache=1&type=1&fid=0&uin= 8�`7
   &vfwebqq= 8�`7   &t= !�`��          6j    ��          6j    ��          6�`           _����1_��������                                              j               6�`           _����1_�������                              &                    8   H       P   j�`��          6j�`��          6j4               68�`9	   
  78�`7�`      �   _ͼƬ��_ͷ��_���������ſ�               Y   �`%�`%�`%       *       �   ����λ��      �   ����λ��      �   ���ܼ�״̬                               j�`��          6	           ��ȡǩ��          �`%         �   �����ı�                 �   y  �         �   X  �     �   2  H  �  �     �  �  j    ��      �   http://s.web2.qq.com/api/get_single_long_nick2?tuin=2674391811&vfwebqq=60114f70c1ae7082d05a61221dc7eaefdb5dc18a0b277d69a8578611e55eea7aa8a3339949e645cd&t=1336888684296 6j4               68�`%7!n4��          6!               65   http://s.web2.qq.com/api/get_single_long_nick2?tuin= 8�`7
   &vfwebqq= 8�`7   &t= !�`��          6   GET j4               68�`R9�`�`R9	     7!f4��          68�`%7�`  j    ��          6   �   �[�`�`h�`�`�`�`       (   9   Q   e   v   �        �   clintid       �   ptwebqq       �   skey       �   ����cookies       �   vfwebqq       �   QQ��       �   �ǳ�       �   ����cookies1     L4A ��       ���߳�����֤       �   �45�45�45�45�45�45       ,   G   `   z       �   DebugInfo      �   LockCount      �   RecursionCount      �   OwningThread      �   LockSemaphore      �   SpinCount  �   t4
u4
v4
w4
x4
y4
z4
{4
|4
}4
~4
4
�4
�4
�4
�4
�4
�4
�4
�4
�4
�4
�4
�4
�4
Е� ��� 0�� ��� ��� @�� � ��� P��  �� ��� `�� �� ��� p��  �� А� ��� 0�� ��� `�� �� ��� p��  ��     �   CoInitialize   ��ʼ������ʼ	   ole32.dll   CoInitialize       5E        �   pvReserved 0     �   CoUninitialize   ��ʼ���������	   ole32.dll   CoUninitialize             �   InternetSetCookieA
   ����COOKIE   wininet.dll   InternetSetCookieA   K   5E5E5E       "        �   ����       �   ����       �   ����      �   CreateThread   �����̣߳��������̵߳ľ��   kernel32.dll   CreateThread   �  5E5E5E5E5E5E    .   f   �   �   R  *    �   lpThreadAttributes 0�̵߳İ�ȫ���� 4    �   dwStackSize 0�̵߳Ķ�ջ��С��Ϊ0ʱ�������ͬ )     �   lpStartAddress �̺߳�������ʼ��ַ =    �   lpParameter �����̵߳�������,���Դ���һ�������Ͳ����� z    �   dwCreationFlags 0�����̺߳������������෴���Ǳ�־λCREATE_SUSPENDED����������Ҫ�Ժ���ʾ���ø��߳����У�����Ϊ��1�� 2    �  lpThreadId 0�ں˸������ɵ��̷߳�����߳�ID     �   GetCurrentThreadId   ȡ��ǰ�߳̾��   kernel32.dll   GetCurrentThreadId            �   ResumeThread   �ָ���������߳�   kernel32.dll   ResumeThread   $    5E        �   hThread �߳̾��     �   SuspendThread   �����߳�   kernel32.dll   SuspendThread   $   !5E        �   hThread �߳̾��           InitializeCriticalSection
   ��������֤   kernel32.dll   InitializeCriticalSection   0   "5E    $   L4A  lpCriticalSection ��������֤           DeleteCriticalSection
   ɾ������֤   kernel32.dll   DeleteCriticalSection   &   #5E       L4A  lpCriticalSection            EnterCriticalSection
   ����������   kernel32.dll   EnterCriticalSection   &   $5E       L4A  lpCriticalSection      �   TerminateThread   ��ֹ�߳�   kernel32.dll   TerminateThread   D   %5E&5E           �   hThread �߳̾��     �   dwExitCode 0     �   CloseHandle   �ر�һ���ں˶���   kernel32.dll   CloseHandle   2   '5E    &    �   hObject ���رյ�һ������ľ��     �   InitDecompression       gzip.dll   InitDecompression            �   CreateDecompression       gzip.dll   CreateDecompression   6   (5E)5E           �  context      �   flags      �
   Decompress   ��ѹ   gzip.dll
   Decompress   �   *5E+5E,5E-5E.5E/5E05E       (   ?   T   l   �       �   context       �   inBytes      �   input_size       �   outBytes      �   output_size      �  input_used      �  output_used            DestroyDecompression       gzip.dll   DestroyDecompression      15E        �   context      �   InitCompression       gzip.dll   InitCompression            �   CreateCompression       gzip.dll   CreateCompression   6   25E35E           �  context      �   flags      �   Compress   ѹ��   gzip.dll   Compress   �   45E55E65E75E85E95E:5E;5E       (   ?   T   l   �   �       �   context       �   inBytes      �   input_size       �   outBytes      �   output_size      �  input_used      �  output_used      �   compressionLevel      �   DestroyCompression       gzip.dll   DestroyCompression      <5E        �   context       �   InternetGetCookieA
   ��ȡCOOKIE   wininet.dll   InternetGetCookieA   d   =5E>5E?5E@5E       "   3        �   ����       �   ����       �   ����      �  �ߴ�      �   lstrcpyn�ı�
   ȡ����ָ��   kernel32.dll   lstrcpyn   X   A5EB5EC5E       .        �  ����1 ���Ϳɱ䶯      �  ����2      �   ���� 0     �   lstrcpyn����
   ȡ����ָ��   kernel32.dll   lstrcpyn   X   D5EE5EF5E       .       �  ����1 ���Ϳɱ䶯     �  ����2      �   ���� 0     �   WaitForSingleObject   �ȴ��߳�   kernel32.dll   WaitForSingleObject   @   G5EH5E           �   hHandle      �   ��ʱ 0Ϊ���޵ȴ�     �   lstrcpyn�ֽڼ�
   ȡ����ָ��   kernel32.dll   lstrcpyn   X   I5EJ5EK5E       .        �  ����1 ���Ϳɱ䶯      �  ����2      �   ���� 0                                         s��}Ds ��¥������s s s s s                                                               s���s ��Ⱥ��ޱ���s s s s s          ��k`�                                                 ��  ��!��*�       ������ҳ����<   C:\Documents and Settings\Administrator\����\������ҳ����.ec   L4At4
�4q4IM4         	      $   s��!Cs ˨���Ļ��9s s s s s         r4	                                           q4I   r4I   s4	   s����s �ɳ����գ��s s s s s         8M
2                                                     �`�.    ����1                 ����s���s 	�൴��ƻ��;s 	s 	s 	s 	s   	      ��ꢆ                                                   �      	    R      �
   
      
  Y �          �`R   	 � �            �`   �       s�}ݴs 
˨���Ż��;s 
s 
s 
s 
s   
      <���`                                            R ����1 R     T R	 ����`2�`R�`   �`�`R�`    �`�`R�`�����`ss s                                                                                        