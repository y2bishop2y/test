//
//  Shader.fsh
//  RPG
//
//  Created by Emiliano Berenbaum on 1/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

varying lowp vec4 colorVarying;

void main()
{
    gl_FragColor = colorVarying;
}
