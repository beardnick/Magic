//>>built
require({cache:{"JBrowse/Store/SeqFeature/GlobalStatsEstimationMixin":function(){define(["dojo/_base/declare","dojo/_base/array","dojo/Deferred"],function(o,q,n){return o(null,{_estimateGlobalStats:function(g){var l=new n,g=g||this.refSeq,e=function(d,e){var a=this,j=0.75*g.start+0.25*g.end,c=Math.max(0,Math.round(j-d/2)),b=Math.min(Math.round(j+d/2),g.end),i=[];this._getFeatures({ref:g.name,start:c,end:b},function(b){i.push(b)},function(){i=q.filter(i,function(i){return i.get("start")>=c&&i.get("end")<=
b});e.call(a,d,{featureDensity:i.length/d,_statsSampleFeatures:i.length,_statsSampleInterval:{ref:g.name,start:c,end:b,length:d}})},function(b){console.error(b);e.call(a,d,null,b)})},d=function(h,m,a){if(a)l.reject(a);else{var j=g.end-g.start;300<=m._statsSampleFeatures||2*h>j||a?l.resolve(m):e.call(this,2*h,d)}};e.call(this,100,d);return l}})})},"JBrowse/Store/SeqFeature/BAM/File":function(){define("dojo/_base/declare,dojo/_base/array,JBrowse/has,JBrowse/Util,JBrowse/Errors,JBrowse/Store/LRUCache,./Util,./LazyFeature".split(","),
function(o,q,n,g,l,e,d,h){var m=function(){console.error.apply(console,arguments)},a=g.fastDeclare({constructor:function(b,i,a){this.minv=b;this.maxv=i;this.bin=a},toUniqueString:function(){return this.minv+".."+this.maxv+" (bin "+this.bin+")"},toString:function(){return this.toUniqueString()},fetchedSize:function(){return this.maxv.block+65536-this.minv.block+1}}),j=d.readInt,c=d.readVirtualOffset;return o(null,{constructor:function(b){this.store=b.store;this.data=b.data;this.bai=b.bai;this.chunkSizeLimit=
b.chunkSizeLimit||5E6},init:function(b){var i=b.success||function(){},a=b.failure||function(b){console.error(b,b.stack)};this._readBAI(dojo.hitch(this,function(){this._readBAMheader(function(){i()},a)}),a)},_readBAI:function(b,i){this.bai.fetch(dojo.hitch(this,function(a){if(a)if(n("typed-arrays")){var f=new Uint8Array(a);if(21578050!=j(f,0))m("Not a BAI file"),i("Not a BAI file");else{var d=j(f,4);this.indices=[];for(var k=8,e=0;e<d;++e){for(var p=k,g=j(f,k),k=k+4,h=0;h<g;++h){j(f,k);for(var l=j(f,
k+4),k=k+8,r=0;r<l;r++)this._findMinAlignment(c(f,k)),k+=16}h=j(f,k);k+=4;this._findMinAlignment(h?c(f,k):null);k+=8*h;if(0<g||0<h)this.indices[e]=new Uint8Array(a,p,k-p)}this.empty=!this.indices.length;b(this.indices,this.minAlignmentVO)}}else m("Web browser does not support typed arrays"),i("Web browser does not support typed arrays");else m("No data read from BAM index (BAI) file"),i("No data read from BAM index (BAI) file")}),i)},_findMinAlignment:function(b){if(b&&(!this.minAlignmentVO||0>this.minAlignmentVO.cmp(b)))this.minAlignmentVO=
b},_readBAMheader:function(b,i){var a=this;a.data.read(0,a.minAlignmentVO?a.minAlignmentVO.block+65535:null,function(f){try{var c;try{c=new Uint8Array(d.unbgzf(f))}catch(k){throw Error("Could not uncompress BAM data. Is it compressed correctly?");}if(21840194!=j(c,0))throw Error("Not a BAM file");var e=j(c,4);a._readRefSeqs(e+8,262144,b,i)}catch(p){m(""+p),i(""+p)}},i)},_readRefSeqs:function(b,i,a,f){var c=this;c.data.read(0,b+i,function(k){var k=d.unbgzf(k),k=new Uint8Array(k),e=j(k,b),p=b+4;c.chrToIndex=
{};c.indexToChr=[];for(var h=0;h<e;++h){for(var m=j(k,p),g="",l=0;l<m-1;++l)g+=String.fromCharCode(k[p+4+l]);l=j(k,p+m+4);c.chrToIndex[c.store.browser.regularizeReferenceName(g)]=h;c.indexToChr.push({name:g,length:l});p=p+8+m;if(p>k.length){i*=2;console.warn("BAM header is very big.  Re-fetching "+i+" bytes.");c._readRefSeqs(b,i,a,f);return}}a()},f)},blocksForRange:function(b,i,s){var f=this.indices[b];if(!f)return[];for(var b=function(){for(var b={},a=this._reg2bins(i,s),c=0;c<a.length;++c)b[a[c]]=
!0;return b}.call(this),d=[],k=[],e=j(f,0),h=4,g=0;g<e;++g){var m=j(f,h),l=j(f,h+4),h=h+8;if(b[m])for(var o=0;o<l;++o){var n=c(f,h),q=c(f,h+8);(4681>m?k:d).push(new a(n,q,m));h+=16}else h+=16*l}var u=function(){for(var b=null,a=j(f,h),d=Math.min(i>>14,a-1),a=Math.min(s>>14,a-1);d<=a;++d){var k=c(f,h+4+8*d);if(k&&(!b||0<k.cmp(b)))b=k}return b}();u&&(k=function(b){for(var a=[],i=0;i<b.length;++i){var c=b[i];c.maxv.block>=u.block&&a.push(c)}return a}(k));b=k.concat(d).sort(function(b,a){return b.minv.block-
a.minv.block||b.minv.offset-a.minv.offset});d=[];if(b.length){k=b[0];for(e=1;e<b.length;++e)g=b[e],g.minv.block==k.maxv.block?k=new a(k.minv,g.maxv,"merged"):(d.push(k),k=g);d.push(k)}return d},fetch:function(b,a,c,f,j,d){var b=this.store.browser.regularizeReferenceName(b),b=this.chrToIndex&&this.chrToIndex[b],e;0<=b?(e=this.blocksForRange(b,a,c))||d(new l.Fatal("Error in index fetch")):e=[];e.toString=function(){return this.join(", ")};try{this._fetchChunkFeatures(e,b,a,c,f,j,d)}catch(h){d(h)}},
_fetchChunkFeatures:function(b,a,c,f,d,j,h){if(b.length){for(var m=0,o=this.featureCache=this.featureCache||new e({name:"bamFeatureCache",fillCallback:dojo.hitch(this,"_readChunk"),sizeFunction:function(b){return b.length},maxSize:1E5}),n=0;n<b.length;n++){var t=b[n].fetchedSize();if(t>this.chunkSizeLimit){h(new l.DataOverflow("Too many BAM features. BAM chunk size "+g.commifyNumber(t)+" bytes exceeds chunkSizeLimit of "+g.commifyNumber(this.chunkSizeLimit)+"."));return}}var r;q.forEach(b,function(e){o.get(e,
function(e,g){g&&!r&&h(g);if(!(r=r||g)){for(var l=0;l<e.length;l++){var n=e[l];if(n._refID==a)if(n.get("start")>f)break;else n.get("end")>=c&&d(n)}++m==b.length&&j()}})})}else j()},_readChunk:function(b,a){var c=this,f=[];c.data.read(b.minv.block,b.fetchedSize(),function(j){try{var e=d.unbgzf(j,b.maxv.block-b.minv.block+1);c.readBamFeatures(new Uint8Array(e),b.minv.offset,f,a)}catch(h){a(null,new l.Fatal(h))}},function(b){a(null,new l.Fatal(b))})},readBamFeatures:function(b,a,c,f){for(var d=this,
e=0;;)if(a>=b.length){f(c);break}else if(300>=e){var g=j(b,a),g=a+4+g-1;if(g<b.length){var m=new h({store:this.store,file:this,bytes:{byteArray:b,start:a,end:g}});c.push(m);e++}a=g+1}else{window.setTimeout(function(){d.readBamFeatures(b,a,c,f)},1);break}},_reg2bin:function(b,a){--a;return b>>14==a>>14?4681+(b>>14):b>>17==a>>17?585+(b>>17):b>>20==a>>20?73+(b>>20):b>>23==a>>23?9+(b>>23):b>>26==a>>26?1+(b>>26):0},MAX_BIN:37449,_reg2bins:function(b,a){var c,f=[0];--a;for(c=1+(b>>26);c<=1+(a>>26);++c)f.push(c);
for(c=9+(b>>23);c<=9+(a>>23);++c)f.push(c);for(c=73+(b>>20);c<=73+(a>>20);++c)f.push(c);for(c=585+(b>>17);c<=585+(a>>17);++c)f.push(c);for(c=4681+(b>>14);c<=4681+(a>>14);++c)f.push(c);return f}})})},"JBrowse/Store/SeqFeature/BAM/Util":function(){define(["jszlib/inflate","jszlib/arrayCopy","JBrowse/Util"],function(o,q,n){var g=n.fastDeclare({constructor:function(e,d){this.block=e;this.offset=d},toString:function(){return""+this.block+":"+this.offset},cmp:function(e){return e.block-this.block||e.offset-
this.offset}}),l={readInt:function(e,d){return e[d+3]<<24|e[d+2]<<16|e[d+1]<<8|e[d]},readShort:function(e,d){return e[d+1]<<8|e[d]},readFloat:function(e,d){for(var h=new Uint8Array(4),g=0;4>g;g++)h[g]=e[d+g];return(new Float32Array(h.buffer))[0]},readVirtualOffset:function(e,d){var h=4294967296*(e[d+6]&255)+16777216*(e[d+5]&255)+65536*(e[d+4]&255)+256*(e[d+3]&255)+(e[d+2]&255),m=e[d+1]<<8|e[d];return 0==h&&0==m?null:new g(h,m)},unbgzf:function(e,d){for(var d=Math.min(d||Infinity,e.byteLength-27),
g=[],m=0,a=[0];a[0]<d;a[0]+=8){var j=new Uint8Array(e,a[0],18);if(!(31==j[0]&&139==j[1])){console.error("invalid BGZF block header, skipping",j);break}var j=l.readShort(j,10),j=a[0]+12+j,c;try{c=o(e,j,e.byteLength-j,a)}catch(b){if(/^Z_BUF_ERROR/.test(b.statusString)&&g.length)break;else throw b;}c.byteLength&&(m+=c.byteLength,g.push(c))}if(1==g.length)return g[0];m=new Uint8Array(m);for(c=a=0;c<g.length;++c)j=new Uint8Array(g[c]),q(j,0,m,a,j.length),a+=j.length;return m.buffer}};return l})},"JBrowse/Store/SeqFeature/BAM/LazyFeature":function(){define(["dojo/_base/array",
"JBrowse/Util","./Util","JBrowse/Model/SimpleFeature"],function(o,q,n,g){var l="=,A,C,x,G,x,x,x,T,x,x,x,x,x,x,N".split(","),e="M,I,D,N,S,H,P,=,X,?,?,?,?,?,?,?".split(","),d=n.readInt,h=n.readShort,m=n.readFloat;return q.fastDeclare({constructor:function(a){this.file=a.file;this.data={type:"match",source:a.store.source};this.bytes={start:a.bytes.start,end:a.bytes.end,byteArray:a.bytes.byteArray};this._coreParse()},get:function(a){return this._get(a.toLowerCase())},_get:function(a){return a in this.data?
this.data[a]:this.data[a]=this[a]?this[a]():this._flagMasks[a]?this._parseFlag(a):this._parseTag(a)},tags:function(){return this._get("_tags")},_tags:function(){this._parseAllTags();var a="seq,seq_reverse_complemented,unmapped,qc_failed,duplicate,secondary_alignment,supplementary_alignment".split(",");this._get("unmapped")||a.push("start","end","strand","score","qual","MQ","CIGAR","length_on_ref","template_length");this._get("multi_segment_template")&&a.push("multi_segment_all_correctly_aligned",
"multi_segment_next_segment_unmapped","multi_segment_next_segment_reversed","multi_segment_first","multi_segment_last","next_segment_position");var a=a.concat(this._tagList||[]),d=this.data,c;for(c in d)d.hasOwnProperty(c)&&"_"!=c[0]&&"multi_segment_all_aligned"!=c&&"next_seq_id"!=c&&a.push(c);var b={};return a=o.filter(a,function(a){if(a in this.data&&void 0===this.data[a])return!1;var a=a.toLowerCase(),c=b[a];b[a]=!0;return!c},this)},parent:function(){},children:function(){return this._get("subfeatures")},
id:function(){return this._get("name")+"/"+this._get("md")+"/"+this._get("cigar")+"/"+this._get("start")+"/"+this._get("multi_segment_next_segment_reversed")},multi_segment_all_aligned:function(){return this._get("multi_segment_all_correctly_aligned")},mq:function(){var a=(this._get("_bin_mq_nl")&65280)>>8;return 255==a?void 0:a},score:function(){return this._get("mq")},qual:function(){if(!this._get("unmapped")){for(var a=[],d=this.bytes.byteArray,c=this.bytes.start+36+this._get("_l_read_name")+4*
this._get("_n_cigar_op")+this._get("_seq_bytes"),b=this._get("seq_length"),i=0;i<b;++i)a.push(d[c+i]);return a.join(" ")}},strand:function(){return this._get("seq_reverse_complemented")?-1:1},multi_segment_next_segment_strand:function(){return this._get("multi_segment_next_segment_unmapped")?void 0:this._get("multi_segment_next_segment_reversed")?-1:1},_l_read_name:function(){return this._get("_bin_mq_nl")&255},_seq_bytes:function(){return this._get("seq_length")+1>>1},seq:function(){for(var a="",
d=this.bytes.byteArray,c=this.bytes.start+36+this._get("_l_read_name")+4*this._get("_n_cigar_op"),b=this._get("_seq_bytes"),i=0;i<b;++i){var e=d[c+i],a=a+l[(e&240)>>4];a.length<this.get("seq_length")&&(a+=l[e&15])}return a},name:function(){return this._get("_read_name")},_read_name:function(){for(var a=this.bytes.byteArray,d="",c=this._get("_l_read_name"),b=this.bytes.start+36,e=0;e<c-1;++e)d+=String.fromCharCode(a[b+e]);return d},_n_cigar_op:function(){return this._get("_flag_nc")&65535},cigar:function(){if(!this._get("unmapped")){for(var a=
this.bytes.byteArray,j=this._get("_n_cigar_op"),c=this.bytes.start+36+this._get("_l_read_name"),b="",i=0,g=0;g<j;++g){var f=d(a,c),h=f>>4,f=e[f&15],b=b+(h+f);"H"!=f&&"S"!=f&&"I"!=f&&(i+=h);c+=4}this.data.length_on_ref=i;return b}},next_segment_position:function(){var a=this.file.indexToChr[this._get("_next_refid")];if(a)return a.name+":"+this._get("_next_pos")},subfeatures:function(){var a=this._get("cigar");if(a)return this._cigarToSubfeats(a)},length_on_ref:function(){this._get("cigar");return this.data.length_on_ref},
_flags:function(){return(this.get("_flag_nc")&4294901760)>>16},end:function(){return this._get("start")+(this._get("length_on_ref")||this._get("seq_length")||void 0)},seq_id:function(){return this._get("unmapped")?void 0:(this.file.indexToChr[this._refID]||{}).name},next_seq_id:function(){return this._get("multi_segment_next_segment_unmapped")?void 0:(this.file.indexToChr[this._get("_next_refid")]||{}).name},_bin_mq_nl:function(){return d(this.bytes.byteArray,this.bytes.start+12)},_flag_nc:function(){return d(this.bytes.byteArray,
this.bytes.start+16)},seq_length:function(){return d(this.bytes.byteArray,this.bytes.start+20)},_next_refid:function(){return d(this.bytes.byteArray,this.bytes.start+24)},_next_pos:function(){return d(this.bytes.byteArray,this.bytes.start+28)},template_length:function(){return d(this.bytes.byteArray,this.bytes.start+32)},_coreParse:function(){this._refID=d(this.bytes.byteArray,this.bytes.start+4);this.data.start=d(this.bytes.byteArray,this.bytes.start+8)},_parseTag:function(a){if(!this._allTagsParsed){this._tagList=
this._tagList||[];for(var e=this.bytes.byteArray,c=this._tagOffset||this.bytes.start+36+this._get("_l_read_name")+4*this._get("_n_cigar_op")+this._get("_seq_bytes")+this._get("seq_length"),b=this.bytes.end;c<b&&g!=a;){var i=String.fromCharCode(e[c],e[c+1]),g=i.toLowerCase(),f=String.fromCharCode(e[c+2]),c=c+3;switch(f.toLowerCase()){case "a":f=String.fromCharCode(e[c]);c+=1;break;case "i":f=d(e,c);c+=4;break;case "c":f=e[c];c+=1;break;case "s":f=h(e,c);c+=2;break;case "f":f=m(e,c);c+=4;break;case "z":case "h":for(f=
"";c<=b;){var l=e[c++];if(0==l)break;else f+=String.fromCharCode(l)}break;default:console.warn("Unknown BAM tag type '"+f+"', tags may be incomplete"),f=void 0,c=b}this._tagOffset=c;this._tagList.push(i);if(g==a)return f;this.data[g]=f}this._allTagsParsed=!0}},_parseAllTags:function(){this._parseTag()},_flagMasks:{multi_segment_template:1,multi_segment_all_correctly_aligned:2,unmapped:4,multi_segment_next_segment_unmapped:8,seq_reverse_complemented:16,multi_segment_next_segment_reversed:32,multi_segment_first:64,
multi_segment_last:128,secondary_alignment:256,qc_failed:512,duplicate:1024,supplementary_alignment:2048},_parseFlag:function(a){return!!(this._get("_flags")&this._flagMasks[a])},_parseCigar:function(a){return o.map(a.match(/\d+\D/g),function(a){return[a.match(/\D/)[0].toUpperCase(),parseInt(a)]})},_cigarToSubfeats:function(a){for(var e=[],c=this._get("start"),b,a=this._parseCigar(a),d=0;d<a.length;d++){var h=a[d][1],f=a[d][0];"="===f&&(f="E");switch(f){case "M":case "D":case "N":case "E":case "X":b=
c+h;break;case "I":b=c}"N"!==f&&e.push(new g({data:{type:f,start:c,end:b,strand:this._get("strand"),cigar_op:h+f},parent:this}));c=b}return e}})})}}});
define("JBrowse/Store/SeqFeature/BAM","dojo/_base/declare,dojo/_base/array,dojo/_base/Deferred,dojo/_base/lang,JBrowse/has,JBrowse/Util,JBrowse/Store/SeqFeature,JBrowse/Store/DeferredStatsMixin,JBrowse/Store/DeferredFeaturesMixin,JBrowse/Model/XHRBlob,JBrowse/Store/SeqFeature/GlobalStatsEstimationMixin,./BAM/File".split(","),function(o,q,n,g,l,e,d,h,m,a,j,c){return o([d,h,m,j],{constructor:function(b){var d=b.bam||new a(this.resolveUrl(b.urlTemplate||"data.bam")),e=b.bai||new a(this.resolveUrl(b.baiUrlTemplate||
(b.urlTemplate?b.urlTemplate+".bai":"data.bam.bai")));this.bam=new c({store:this,data:d,bai:e,chunkSizeLimit:b.chunkSizeLimit});this.source=(d.url?d.url.match(/\/([^/\#\?]+)($|[\#\?])/)[1]:d.blob?d.blob.name:void 0)||void 0;l("typed-arrays")?this.bam.init({success:g.hitch(this,function(){this._deferred.features.resolve({success:!0});this._estimateGlobalStats().then(g.hitch(this,function(a){this.globalStats=a;this._deferred.stats.resolve({success:!0})}),g.hitch(this,"_failAllDeferred"))}),failure:g.hitch(this,
"_failAllDeferred")}):this._failAllDeferred("This web browser lacks support for JavaScript typed arrays.")},hasRefSeq:function(a,c,d){var e=this,a=e.browser.regularizeReferenceName(a);this._deferred.stats.then(function(){c(a in e.bam.chrToIndex)},d)},_getFeatures:function(a,c,d,e){this.bam.fetch(this.refSeq.name,a.start,a.end,c,d,e)},saveStore:function(){return{urlTemplate:this.config.bam.url,baiUrlTemplate:this.config.bai.url}}})});