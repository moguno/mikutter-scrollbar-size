# -*- coding: utf-8 -*-

Plugin.create :scrollbar_size do
  UserConfig[:scrollbar_size] ||= 24

  settings "スクロールバーのサイズ" do
      adjustment("スクロールバーの幅（再起動必要）", :scrollbar_size, 1, 100)
  end

  Gtk::RC.parse_string <<-EOS
    style "scrollbar"
    {
      GtkRange::slider_width = #{UserConfig[:scrollbar_size]}
      GtkRange::stepper_size = #{UserConfig[:scrollbar_size]}
    }

    class "GtkRange" style "scrollbar"
  EOS

end
