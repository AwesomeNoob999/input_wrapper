class Input
    def initialize(input=STDIN)
	@input = input.raw!
	@input_buffer = []
	LISTENERS = []
	@input_processed = []
	@tool = {27=>:KB_ESCAPE, 96=>:KB_BACKTICK, 49=>:KB_1, 50=>:KB_2, 51=>:KB_3, 52=>:KB_4, 53=>:KB_5, 54=>:KB_6, 55=>:KB_7, 56=>:KB_8, 57=>:KB_9, 48=>:KB_0, 45=>:KB_DASH, 61=>:KB_EQUALS, 127=>:KB_BACKSPACE, 9=>:KB_TAB, 113=>:KB_Q, 119=>:KB_W, 101=>:KB_E, 114=>:KB_R, 116=>:KB_T, 121=>:KB_Y, 117=>:KB_U, 105=>:KB_I, 111=>:KB_O, 112=>:KB_P, 91=>:KB_LEFT_SQUARE, 93=>:KB_RIGHT_SQUARE, 92=>:KB_BACKSLASH, 97=>:KB_A, 115=>:KB_S, 100=>:KB_D, 102=>:KB_F, 103=>:KB_G, 104=>:KB_H, 106=>:KB_J, 107=>:KB_K, 108=>:KB_L, 59=>:KB_SEMICOLON, 39=>:KB_SINGLE_QUOTE, 122=>:KB_Z, 120=>:KB_X, 99=>:KB_C, 118=>:KB_V, 98=>:KB_B, 110=>:KB_N, 109=>:KB_M, 44=>:KB_COMMA, 46=>:KB_PERIOD, 47=>:KB_SLASH, 126=>:KB_GRAVE, 33=>:KB_EXCLAIMATION, 64=>:KB_AT, 35=>:KB_HASHTAG, 36=>:KB_DOLLAR, 37=>:KB_PERCENT, 94=>:KB_UPTICK, 38=>:KB_AMPERSAND, 42=>:KB_MULTIPLY, 40=>:KB_LEFT_PARENTHESIS, 41=>:KB_RIGHT_PARENTHESIS, 95=>:KB_UNDERLINE, 43=>:KB_ADDITION, 81=>:KB_CAP_Q, 87=>:KB_CAP_W, 69=>:KB_CAP_E, 82=>:KB_CAP_R, 84=>:KB_CAP_T, 89=>:KB_CAP_Y, 85=>:KB_CAP_U, 73=>:KB_CAP_I, 79=>:KB_CAP_O, 80=>:KB_CAP_P, 123=>:KB_LEFT_CURLY, 125=>:KB_RIGHT_CURLY, 124=>:KB_SEPARATOR, 65=>:KB_CAP_A, 83=>:KB_CAP_S, 68=>:KB_CAP_D, 70=>:KB_CAP_F, 71=>:KB_CAP_G, 72=>:KB_CAP_H, 74=>:KB_CAP_J, 75=>:KB_CAP_K, 76=>:KB_CAP_L, 58=>:KB_COLON, 34=>:KB_DOUBLE_QUOTE, 90=>:KB_CAP_Z, 88=>:KB_CAP_X, 67=>:KB_CAP_C, 86=>:KB_CAP_V, 66=>:KB_CAP_B, 78=>:KB_CAP_N, 77=>:KB_CAP_M, 60=>:KB_LESS_THAN, 62=>:KB_GREATER_THAN, 63=>:KB_QUESTION, 3=>:KB_CTRL_C, [],[],[],[]}
    end
    def handle
	@input_buffer.push[0](@input.getbyte)
	if @input_buffer.length > 255
	    @input_buffer.pop[-1]
	end
    end
    def opt_in(oid)
	LISTENERS << oid
    end
    def tell
	if !@input_buffer.empty
	    for obj in LISTENERS
		obj.has_input = true
	    end
	end
    end
    def get_input
	return @input_processed
    end
    def process_input
	for input in @input_buffer
	    @input_processed << input_to_sym(input)
	end
    end
    def input_to_sym(input)
	temp_input_var = @tool.value_at(input)
	if temp_input_var != nil
	    @input_processed << temp_input_var
	end
    end
end
