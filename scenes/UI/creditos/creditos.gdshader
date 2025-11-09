shader_type canvas_item;

uniform sampler2D pattern_texture : source_color, filter_linear, repeat_enable;
uniform vec2 scroll_speed = vec2(0.05, 0.0);
uniform float time;

void fragment() {
    vec2 uv = UV + scroll_speed * time;
    COLOR = texture(pattern_texture, fract(uv));
}
