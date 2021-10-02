module HomeHelper
  def cut_off_prompt
    Setting.first.present? ? "The cut off time of week is: #{Setting.first.cut_off_at.strftime("%Y-%m-%d %H:%M")}" : "Cut off time is not ready yet."
  end
end