// 特殊能力セレクト（選択した要素と同様の背景色をセレクトボックスに適用）
function setupSelectBox(selectBoxId) {
  var selectBox = document.getElementById(selectBoxId);
  selectBox.addEventListener("change", function () {
    // 現在の選択肢のクラスを取得
    var selectedOptionClass = this.options[this.selectedIndex].className;

    // セレクトボックスのクラスを更新
    this.className = "form-select " + selectedOptionClass;
  });
}

// ページが読み込まれたときに関数を実行
document.addEventListener("DOMContentLoaded", function () {
  // 回復
  setupSelectBox("kaifuku-select");
  // ケガしにくさ
  setupSelectBox("kegasinikusa-select");
});

// 基礎能力入力（入力値でアルファベット＋背景色を変更）
function setupInputField(inputFieldId, displaySpanId) {
  const updateSpan = () => {
    const inputValue = document.getElementById(inputFieldId).value;
    let spanClass = "";
    let spanText = "";

    // 共通ロジック
    if (inputValue >= 1 && inputValue <= 29) {
      spanClass = "pawa-bg-g";
      spanText = "G";
    } else if (inputValue >= 30 && inputValue <= 39) {
      spanClass = "pawa-bg-f";
      spanText = "F";
    } else if (inputValue >= 40 && inputValue <= 49) {
      spanClass = "pawa-bg-e";
      spanText = "E";
    } else if (inputValue >= 50 && inputValue <= 59) {
      spanClass = "pawa-bg-d";
      spanText = "D";
    } else if (inputValue >= 60 && inputValue <= 69) {
      spanClass = "pawa-bg-c";
      spanText = "C";
    } else if (inputValue >= 70 && inputValue <= 79) {
      spanClass = "pawa-bg-b";
      spanText = "B";
    } else if (inputValue >= 80 && inputValue <= 89) {
      spanClass = "pawa-bg-a";
      spanText = "A";
    } else if (inputValue >= 90 && inputValue <= 100) {
      spanClass = "pawa-bg-s";
      spanText = "S";
    } else {
      // エラーケース
      spanClass = "";
      spanText = "";
    }

    // span要素の更新
    const spanElement = document.getElementById(displaySpanId);
    spanElement.className = `input-group-text text-white ${spanClass}`;
    spanElement.textContent = spanText;
  };

  updateSpan(); // 初期状態の設定
  document.getElementById(inputFieldId).addEventListener("input", updateSpan);
}

// ページが読み込まれたときに関数を実行
document.addEventListener("DOMContentLoaded", function () {
  // コントロール
  setupInputField("control-input", "control-alphabet-display");
  // スタミナ
  setupInputField("stamina-input", "stamina-alphabet-display");
});
