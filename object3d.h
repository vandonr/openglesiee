/*
Classe Objet3D
Author: Clement Robein

Classe de stockage des mod�les 3D au format OBJ

*/

#ifndef OBJECT3D_H
#define OBJECT3D_H

#include <stdio.h>
#include <vector>
#include "vec3.h"

#include <GL/glut.h>
#include <GL/glu.h>

struct Triangle{
	int Vertex[3];
	int Normal[3];
	int TexCoord[3];
};

class Object3D {
	public:
		Object3D();
		~Object3D();
		
		Object3D(const Object3D& o);
		Object3D& operator=(const Object3D& o);
		void draw();

		std::vector<vec3> m_vertexArray;
		std::vector<vec3> m_normalArray;
		std::vector<vec3> m_texCoordArray;
		std::vector<Triangle> m_triangleArray;
	};

#endif