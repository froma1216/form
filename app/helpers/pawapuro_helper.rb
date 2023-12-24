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

  # 能力値（弾道）によって文字色変更
  # TODO: ↗を表示し、値によって角度を変える
  def display_trajectory(val)
    class_name = case val
                 when 1 then "pawa-text-d"
                 when 2 then "pawa-text-c"
                 when 3 then "pawa-text-b"
                 when 4 then "pawa-text-a"
                 else "pawa-text-bad"
                 end
    content_tag(:span, val.to_s, class: class_name)
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
      content_tag(:span, "ERR ", class: "pawa-text-bad")
    end
  end
end
