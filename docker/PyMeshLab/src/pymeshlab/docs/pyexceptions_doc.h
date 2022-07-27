/****************************************************************************
* PyMeshLab                                                         o o     *
* A versatile mesh processing toolbox                             o     o   *
*                                                                _   O  _   *
* Copyright(C) 2005-2021                                           \/)\/    *
* Visual Computing Lab                                            /\/|      *
* ISTI - Italian National Research Council                           |      *
*                                                                    \      *
* All rights reserved.                                                      *
*                                                                           *
* This program is free software; you can redistribute it and/or modify      *
* it under the terms of the GNU General Public License as published by      *
* the Free Software Foundation; either version 2 of the License, or         *
* (at your option) any later version.                                       *
*                                                                           *
* This program is distributed in the hope that it will be useful,           *
* but WITHOUT ANY WARRANTY; without even the implied warranty of            *
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the             *
* GNU General Public License (http://www.gnu.org/licenses/gpl.txt)          *
* for more details.                                                         *
*                                                                           *
****************************************************************************/
#ifndef PYMESHLAB_PYXCEPTIONS_DOC_H
#define PYMESHLAB_PYXCEPTIONS_DOC_H

namespace pymeshlab {
namespace doc {

//PyMeshLabException
const char* PYEXC_MLEXC =
		"Generic PyMeshLab exception.";

//InvalidPercentageException
const char* PYEXC_INV_PER =
		"Exception raised when an invalid value (not between 0 and 100) "
		"is set in a :py:class:`Percentage` object.";

//InvalidEnumException
const char* PYEXC_INV_ENUM =
		"Exception raised when an invalid enum value "
		"is used as argument of a filter.";

}
}

#endif // PYMESHLAB_PYXCEPTIONS_DOC_H
