tool
extends Polygon2D
class_name RegularPolygon2D

export(float)var radius = 10.0 setget set_radius;
export(int, 3,1000)var vertices = 3 setget set_vertices;
export(bool)var fill = true setget set_fill;
export(float)var thickness = 1.0 setget set_thickness;
export(bool)var refreshNow = false setget reset_now;

func set_radius(value:float):
	radius = value;
	reset();
func set_vertices(value:int):
	vertices = value;
	reset();
func set_fill(value:bool):
	fill = value;
	reset();
func set_thickness(value:float):
	thickness = value;
	reset();
func reset_now(_value:bool):
	refreshNow = false;
	reset();

func reset():
	var points = PoolVector2Array();
	for i in range(vertices):
		points.append(Vector2(radius, 0).rotated(PI*2 / vertices * i));
	if !fill:
		points.append(points[0]);
		for i in range(vertices, 0, -1):
			points.append(Vector2(radius-thickness,0).rotated(PI*2 / (vertices) * i));
		points.append(points[len(points)-vertices]);
#		points.append(points[0]);
	self.polygon = points;
