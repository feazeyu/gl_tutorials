#version 430 core

const vec3 u_lightPosition = vec3(15.0, 40.0, -10.0);

out vec4 out_fragColor;

in vec3 f_position;
in vec2 f_texCoord;

void main() {
	vec3 lightDir = normalize(u_lightPosition - f_position);
	vec3 normal = normalize(cross(dFdx(f_position), dFdy(f_position)));
	float lambertian = max(dot(lightDir, normal), 0.0);
	vec3 terrainColor = vec3(0.0, 1.0, 0.0);
	if (f_position.y > 0.5) {
		terrainColor = vec3(1.0, 1.0, 1.0);
	} else if (f_position.y > 0.2) {
		terrainColor = vec3(0.5, 0.5, 0.5);
	} else if (f_position.y > -0.21) {
		terrainColor = vec3(0.0, 0.5, 0.0);
	} else {
		terrainColor = vec3(0.0, 0.0, 1.0);
	}/**/
	out_fragColor = vec4(terrainColor * lambertian, 1.0);
}