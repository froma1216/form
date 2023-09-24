/*
このコードは、指定されたフォームが送信されるときに特定のAjaxリクエストを実行するためのもの。
指定されたフォームが送信されたときに通常のページのリロードを回避し、代わりにAjaxを使用して非同期にデータを取得して表示を更新する。
 */

$(document).on(
  // $(document).on('submit', 'selector', callback)は、jQueryを使用して指定されたselectorで選択される要素のsubmitイベント（この場合はフォームの送信）に対してイベントリスナーを登録するメソッド。
  "submit",
  // action属性がe_frontier_pathの値に等しいフォームをターゲットとするセレクタ。このセレクタを使用して、特定のフォームの送信のみを捕捉している。
  'form[action="<%= e_frontier_path %>"]',
  function (event) {
    // デフォルトのイベントアクション（この場合はフォームの送信）をキャンセルする
    event.preventDefault();
    // jQueryを使用してAjaxリクエストを実行するメソッド。
    $.ajax({
      url: $(this).attr("action"),
      type: "GET",
      data: $(this).serialize(),
      dataType: "script",
    });
  }
);
