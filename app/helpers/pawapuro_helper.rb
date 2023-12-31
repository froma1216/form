module PawapuroHelper
  # 数値をポジション名に変換
  def display_position_name(val)
    positions = {
      1 => "投",
      2 => "捕",
      3 => "一",
      4 => "二",
      5 => "三",
      6 => "遊",
      7 => "外"
    }
    content_tag(:span, positions[val] || "ERR")
  end

  # 数値をアルファベットに変換
  def display_apecial_ability_alphabet(val)
    positions = {
      -2 => "F",
      -1 => "E",
      0 => "D",
      1 => "C",
      2 => "A"
    }
    content_tag(:span, positions[val] || "")
  end

  # 能力値（弾道）によって文字色、→の角度を変更
  def display_trajectory(trajectory)
    text_color, angle = case trajectory
    when 2
      ["pawa-text-c", "-20deg"]
    when 3
      ["pawa-text-b", "-30deg"]
    when 4
      ["pawa-text-a", "-45deg"]
    else
      ["pawa-text-d", "-10deg"]
    end
    content_tag(:i, "", class: "fa fa-solid fa-arrow-right #{text_color}", style: "transform: rotate(#{angle});")
  end

  # 能力値（弾道以外）をアルファベットに変換＋文字色変更
  def display_alphabet(val)
    case val
    when 1..29
      content_tag(:span, "G ", class: "pawa-text-g")
    when 30..39
      content_tag(:span, "F ", class: "pawa-text-f")
    when 40..49
      content_tag(:span, "E ", class: "pawa-text-e")
    when 50..59
      content_tag(:span, "D ", class: "pawa-text-d")
    when 60..69
      content_tag(:span, "C ", class: "pawa-text-c")
    when 70..79
      content_tag(:span, "B ", class: "pawa-text-b")
    when 80..89
      content_tag(:span, "A ", class: "pawa-text-a")
    when 90..99
      content_tag(:span, "S ", class: "pawa-text-s")
    else
      # エラーケース
      content_tag(:span, "", class: "")
    end
  end

  # 変化球ブロック
  # 変化量によって、色付きのブロックを表示する。
  def breaking_ball_blocks(pitcher, ball_type)
    Array.new(7) do |i|
      class_name = i < pitcher.send("#{ball_type}_type_movement") ? "pawa-breaking-block-exist" : "pawa-breaking-block-nil"
      content_tag(:div, "", class: "col-1 #{class_name}")
    end.join.html_safe
  end

  # 年齢計算
  def calculate_age(birthday)
    now = Date.today
    age = now.year - birthday.year
    age -= 1 if now.yday < birthday.yday
    age
  end
end
