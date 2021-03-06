#encoding:utf-8
#
# 游戲結束畫面
#

class Scene_Gameover < Scene_Base
  #
  # 開始處理
  #
  #
  def start
    super
    play_gameover_music
    fadeout_frozen_graphics
    create_background
  end
  #
  # 結束處理
  #
  #
  def terminate
    super
    dispose_background
  end
  #
  # 更新畫面
  #
  #
  def update
    super
    goto_title if Input.trigger?(:C)
  end
  #
  # 執行漸變
  #
  #
  def perform_transition
    Graphics.transition(fadein_speed)
  end
  #
  # 播放游戲結束畫面的音樂
  #
  #
  def play_gameover_music
    RPG::BGM.stop
    RPG::BGS.stop
    $data_system.gameover_me.play
  end
  #
  # 凍結畫面並淡出
  #
  #
  def fadeout_frozen_graphics
    Graphics.transition(fadeout_speed)
    Graphics.freeze
  end
  #
  # 生成背景
  #
  #
  def create_background
    @sprite = Sprite.new
    @sprite.bitmap = Cache.system("GameOver")
  end
  #
  # 釋放背景
  #
  #
  def dispose_background
    @sprite.bitmap.dispose
    @sprite.dispose
  end
  #
  # 取得淡出速度
  #
  #
  def fadeout_speed
    return 60
  end
  #
  # 取得淡入速度
  #
  #
  def fadein_speed
    return 120
  end
  #
  # 切換到標題畫面
  #
  #
  def goto_title
    fadeout_all
    SceneManager.goto(Scene_Title)
  end
end
