extends Node

# Enum 정의
enum Round {
	ROUND_1,
	ROUND_2,
	ROUND_3,
	ROUND_4,
	ROUND_5,
	ROUND_6,
	ROUND_7,
	ROUND_8,
}

enum Wave {
	WAVE_1,
	WAVE_2,
	WAVE_3,
}

const STAGE_INFO = {
	Round.ROUND_1: {
		Wave.WAVE_1: {"hp": 100, "speed": 120, "size": 10, "enemy_count": 10},
		Wave.WAVE_2: {"hp": 200, "speed": 160, "size": 12, "enemy_count": 5},
		Wave.WAVE_3: {"hp": 2000, "speed": 40, "size": 30, "enemy_count": 1},
	},
}

const ROUND_MAP = {
	1: Round.ROUND_1,
	2: Round.ROUND_2,
	3: Round.ROUND_3,
	4: Round.ROUND_4,
	5: Round.ROUND_5,
	6: Round.ROUND_6
}

const WAVE_MAP = {
	1: Wave.WAVE_1,
	2: Wave.WAVE_2,
	3: Wave.WAVE_3
}

static func get_wave_info(_round: int, _wave: int):
	if ROUND_MAP.has(_round) and WAVE_MAP.has(_wave):
		var round_enum = ROUND_MAP[_round]
		var wave_enum = WAVE_MAP[_wave]
		return STAGE_INFO[round_enum][wave_enum]
	return null
