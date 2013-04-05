#
# スキル、アイテム、武器、防具を統一的に扱うクラスです。セーブデータに含める
# ことができるように、データベースオブジェクト自体への参照は保持しません。
#

class Game_BaseItem
  #
  # オブジェクト初期化
  #
  #
  def initialize
    @class = nil
    @item_id = 0
  end
  #
  # クラス判定
  #
  #
  def is_skill?;   @class == RPG::Skill;   end
  def is_item?;    @class == RPG::Item;    end
  def is_weapon?;  @class == RPG::Weapon;  end
  def is_armor?;   @class == RPG::Armor;   end
  def is_nil?;     @class == nil;          end
  #
  # アイテムオブジェクトの取得
  #
  #
  def object
    return $data_skills[@item_id]  if is_skill?
    return $data_items[@item_id]   if is_item?
    return $data_weapons[@item_id] if is_weapon?
    return $data_armors[@item_id]  if is_armor?
    return nil
  end
  #
  # アイテムオブジェクトの設定
  #
  #
  def object=(item)
    @class = item ? item.class : nil
    @item_id = item ? item.id : 0
  end
  #
  # 装備品を ID で設定
  #
  # is_weapon : 武器かどうか
  # item_id   : 武器／防具 ID
  #
  def set_equip(is_weapon, item_id)
    @class = is_weapon ? RPG::Weapon : RPG::Armor
    @item_id = item_id
  end
end