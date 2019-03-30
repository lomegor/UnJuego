shader_type canvas_item;
render_mode blend_mix;

uniform float outlineSize  = 0.02;
uniform vec4  outlineColor = vec4(0, 0, 0, 0.8);

void fragment()
{
    vec4 tcol = texture(TEXTURE, UV);

    if (tcol.a == 0.0)
    {
        if (texture(TEXTURE, UV + vec2(0.0,          outlineSize)).a  != 0.0 ||
            texture(TEXTURE, UV + vec2(0.0,         -outlineSize)).a  != 0.0 ||
            texture(TEXTURE, UV + vec2(outlineSize,  0.0)).a          != 0.0 ||
            texture(TEXTURE, UV + vec2(-outlineSize, 0.0)).a          != 0.0 ||
            texture(TEXTURE, UV + vec2(-outlineSize, outlineSize)).a  != 0.0 ||
            texture(TEXTURE, UV + vec2(-outlineSize, -outlineSize)).a != 0.0 ||
            texture(TEXTURE, UV + vec2(outlineSize,  outlineSize)).a  != 0.0 ||
            texture(TEXTURE, UV + vec2(outlineSize,  -outlineSize)).a != 0.0) 
            tcol = outlineColor;
    }

    COLOR = tcol;
}
