$(function(){
  var dropzone = $('.exhibit_main_pagging__date__content');
  var images = [];
  var inputs  =[];
  var input_area = $('.input_area');
  var preview = $('#preview');

$(document).on('change', 'input[type="file"]', function(event){
  var file = $(this).prop('files')[0];    //prop()でアップロードの状態を取得し変数に格納
  var reader = new FileReader();          //filereaderのインスタンス作成
  inputs.push($(this));                   //配列にfileをpush
  var img = $('<div class="images_up_contents"><img></div>');
  reader.onload = function(e){            //以下に読み込みが完了したら実行したい処理を記述する
    var btm_upload = $('<div class="images_up_contents__bottom flex"><div class="images_up_contents__bottom__left">編集</div><div class="images_up_contents__bottom__right">削除</div></div>');
    img.append(btm_upload);              //指定した子要素の最後にテキスト文字やHTML要素を追加,imgにbtm_uploadを追加
    img.find('img').attr({               // imgからimgを探しsrcをresultとして返す
      src: e.target.result
    })
  }
  reader.readAsDataURL(file);             //readerでfilefileを取得
  images.push(img);                       // 配列にボタンがついたhtmlを入れ込む


  if(images.length == 5) {
    dropzone.css({
      'display': 'none'
    })
    $.each(images, function(index, image) {
      image.attr('data-image', index);
      preview.append(image);
    })
  } else {
      $('#preview').empty();
      $.each(images, function(index, image) {
        image.attr('data-image', index);
        preview.append(image);
      })
      dropzone.css({
        'width': `calc(100% - (180px * ${images.length}))`
      })
    }
    if(images.length == 3) {
      dropzone.css({
        'font-size': `15px`
      })
      dropzone.find('p').replaceWith('<i class="fa fa-camera"></i>')
    return;
  
    }
 var new_image = $(`<input multiple= "multiple" name="images[image_url][]" class="images_up_contents__up" data-image= ${images.length} type="file" id="upload-image">`);
 input_area.prepend(new_image);

  
});
});





