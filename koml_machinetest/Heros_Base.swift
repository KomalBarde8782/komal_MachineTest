

import Foundation
struct Hero_Base : Codable {
	let id : Int?
	let name : String?
	let localized_name : String?
	let primary_attr : String?
	let attack_type : String?
	let roles : [String]?
	let img : String?
	let icon : String?
	let base_health : Int?
	let base_health_regen : Double?
	let base_mana : Int?
	let base_mana_regen : Int?
	let base_armor : Int?
	let base_mr : Int?
	let base_attack_min : Int?
	let base_attack_max : Int?
	let base_str : Int?
	let base_agi : Int?
	let base_int : Int?
	let str_gain : Double?
	let agi_gain : Int?
	let int_gain : Double?
	let attack_range : Int?
	let projectile_speed : Int?
	let attack_rate : Double?
	let move_speed : Int?
	let turn_rate : Double?
	let cm_enabled : Bool?
	let legs : Int?
	let pro_ban : Int?
	let hero_id : Int?
	let pro_win : Int?
	let pro_pick : Int?
	let one_pick : Int?
	let one_win : Int?
	let two_pick : Int?
	let two_win : Int?
	let three_pick : Int?
	let three_win : Int?
	let four_pick : Int?
	let four_win : Int?
	let five_pick : Int?
	let five_win : Int?
	let six_pick : Int?
	let six_win : Int?
	let seven_pick : Int?
	let seven_win : Int?
	let eight_pick : Int?
	let eight_win : Int?
	let null_pick : Int?
	let null_win : Int?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case name = "name"
		case localized_name = "localized_name"
		case primary_attr = "primary_attr"
		case attack_type = "attack_type"
		case roles = "roles"
		case img = "img"
		case icon = "icon"
		case base_health = "base_health"
		case base_health_regen = "base_health_regen"
		case base_mana = "base_mana"
		case base_mana_regen = "base_mana_regen"
		case base_armor = "base_armor"
		case base_mr = "base_mr"
		case base_attack_min = "base_attack_min"
		case base_attack_max = "base_attack_max"
		case base_str = "base_str"
		case base_agi = "base_agi"
		case base_int = "base_int"
		case str_gain = "str_gain"
		case agi_gain = "agi_gain"
		case int_gain = "int_gain"
		case attack_range = "attack_range"
		case projectile_speed = "projectile_speed"
		case attack_rate = "attack_rate"
		case move_speed = "move_speed"
		case turn_rate = "turn_rate"
		case cm_enabled = "cm_enabled"
		case legs = "legs"
		case pro_ban = "pro_ban"
		case hero_id = "hero_id"
		case pro_win = "pro_win"
		case pro_pick = "pro_pick"
		case one_pick = "1_pick"
		case one_win = "1_win"
		case two_pick = "2_pick"
		case two_win = "2_win"
		case three_pick = "3_pick"
		case three_win = "3_win"
		case four_pick = "4_pick"
		case four_win = "4_win"
		case five_pick = "5_pick"
		case five_win = "5_win"
		case six_pick = "6_pick"
		case six_win = "6_win"
		case seven_pick = "7_pick"
		case seven_win = "7_win"
		case eight_pick = "8_pick"
		case eight_win = "8_win"
		case null_pick = "null_pick"
		case null_win = "null_win"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		localized_name = try values.decodeIfPresent(String.self, forKey: .localized_name)
		primary_attr = try values.decodeIfPresent(String.self, forKey: .primary_attr)
		attack_type = try values.decodeIfPresent(String.self, forKey: .attack_type)
		roles = try values.decodeIfPresent([String].self, forKey: .roles)
		img = try values.decodeIfPresent(String.self, forKey: .img)
		icon = try values.decodeIfPresent(String.self, forKey: .icon)
		base_health = try values.decodeIfPresent(Int.self, forKey: .base_health)
		base_health_regen = try values.decodeIfPresent(Double.self, forKey: .base_health_regen)
		base_mana = try values.decodeIfPresent(Int.self, forKey: .base_mana)
		base_mana_regen = try values.decodeIfPresent(Int.self, forKey: .base_mana_regen)
		base_armor = try values.decodeIfPresent(Int.self, forKey: .base_armor)
		base_mr = try values.decodeIfPresent(Int.self, forKey: .base_mr)
		base_attack_min = try values.decodeIfPresent(Int.self, forKey: .base_attack_min)
		base_attack_max = try values.decodeIfPresent(Int.self, forKey: .base_attack_max)
		base_str = try values.decodeIfPresent(Int.self, forKey: .base_str)
		base_agi = try values.decodeIfPresent(Int.self, forKey: .base_agi)
		base_int = try values.decodeIfPresent(Int.self, forKey: .base_int)
		str_gain = try values.decodeIfPresent(Double.self, forKey: .str_gain)
		agi_gain = try values.decodeIfPresent(Int.self, forKey: .agi_gain)
		int_gain = try values.decodeIfPresent(Double.self, forKey: .int_gain)
		attack_range = try values.decodeIfPresent(Int.self, forKey: .attack_range)
		projectile_speed = try values.decodeIfPresent(Int.self, forKey: .projectile_speed)
		attack_rate = try values.decodeIfPresent(Double.self, forKey: .attack_rate)
		move_speed = try values.decodeIfPresent(Int.self, forKey: .move_speed)
		turn_rate = try values.decodeIfPresent(Double.self, forKey: .turn_rate)
		cm_enabled = try values.decodeIfPresent(Bool.self, forKey: .cm_enabled)
		legs = try values.decodeIfPresent(Int.self, forKey: .legs)
		pro_ban = try values.decodeIfPresent(Int.self, forKey: .pro_ban)
		hero_id = try values.decodeIfPresent(Int.self, forKey: .hero_id)
		pro_win = try values.decodeIfPresent(Int.self, forKey: .pro_win)
		pro_pick = try values.decodeIfPresent(Int.self, forKey: .pro_pick)
        one_pick = try values.decodeIfPresent(Int.self, forKey: .one_pick)
        one_win = try values.decodeIfPresent(Int.self, forKey: .one_win)
		two_pick = try values.decodeIfPresent(Int.self, forKey: .two_pick)
		two_win = try values.decodeIfPresent(Int.self, forKey: .two_win)
        three_pick = try values.decodeIfPresent(Int.self, forKey:.three_pick)
		three_win = try values.decodeIfPresent(Int.self, forKey: .three_win)
		four_pick = try values.decodeIfPresent(Int.self, forKey: .four_pick)
		four_win = try values.decodeIfPresent(Int.self, forKey: .four_win)
		five_pick = try values.decodeIfPresent(Int.self, forKey: .five_pick)
		five_win = try values.decodeIfPresent(Int.self, forKey: .five_win)
		six_pick = try values.decodeIfPresent(Int.self, forKey: .six_pick)
		six_win = try values.decodeIfPresent(Int.self, forKey: .six_win)
		seven_pick = try values.decodeIfPresent(Int.self, forKey: .seven_pick)
		seven_win = try values.decodeIfPresent(Int.self, forKey: .seven_win)
		eight_pick = try values.decodeIfPresent(Int.self, forKey: .eight_pick)
		eight_win = try values.decodeIfPresent(Int.self, forKey: .eight_win)
		null_pick = try values.decodeIfPresent(Int.self, forKey: .null_pick)
		null_win = try values.decodeIfPresent(Int.self, forKey: .null_win)
	}

}
