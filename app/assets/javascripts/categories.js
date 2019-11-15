$(function(){
  function appendOption(category){
    var html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`; 
    return html;
  }
  function appendChildrenBox(inserHTML){  //子カテゴリー
    var childSelectHtml = '';
    childSelectHtml = `<div class="exhibit_box__list__bottom" id="children_wrapper">
                          <select class="select-exhibit" id="child_category" name="item[category_id]">
                            <option value="---" data-category="---">---</option>
                            ${inserHTML}
                          <div class="exhibit_box__list__bottom__icon">
                          <i class="fa fa-chevron-down"></i>
                          </div>
                          </div> `;
    $('.exhibit_box__list__category').append(childSelectHtml);
  }
  function appendGrandchidrenBox(inserHTML){   //孫カテゴリー
    var grandchildSelectHtml = '';
    grandchildSelectHtml = `<div class="exhibit_box__list__bottom" id= "grandchildren_wrapper">
                          <select class="select-exhibit" id="grandchild_category" name="item[category_id]">
                            <option value="---" data-category="---">---</option>
                            ${inserHTML}
                          <div class="exhibit_box__list__bottom__icon">
                          <i class="fa fa-chevron-down"></i>
                          </div>
                          </div> `;
    $('.exhibit_box__list__category').append(grandchildSelectHtml);
  }
  ///親カテゴリー選択後
  $('#parent_category').on('change', function(){
    var parentCategory = document.getElementById('parent_category').value;
    if(parentCategory != "---"){
      $.ajax({
        url:'get_category_children',
        type:'GET',
        data:{ parent_name: parentCategory },
        dataType: 'json'
      })
      .done(function(children){
        $('#children_wrapper').remove(); //親が変更された時、子以下を削除するする
        $('#grandchildren_wrapper').remove();
        var inserHTML= '';
        children.forEach(function(child){
          inserHTML += appendOption(child);
        });
        appendChildrenBox(inserHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#children_wrapper').remove();
      $('#grandchildren_wrapper').remove();
    }
  });
  ///子カテゴリー選択後
  $('.exhibit_box__list__category').on('change', '#child_category', function(){
    var childId = $('#child_category option:selected').data('category'); //選択された子カテゴリーのidを取得
    if (childId != "---"){ //子カテゴリーが初期値でないことを確認
      $.ajax({
        url: 'get_category_grandchildren',
        type: 'GET',
        data: { child_id: childId },
        dataType: 'json'
      })
      .done(function(grandchildren){
        $('#grandchildren_wrapper').remove();
        if (grandchildren.length != 0) {
          var insertHTML = '';
          grandchildren.forEach(function(grandchild){
            insertHTML += appendOption(grandchild);
          });
          appendGrandchidrenBox(insertHTML);
        }
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#grandchildren_wrapper').remove();
    }
});
});

