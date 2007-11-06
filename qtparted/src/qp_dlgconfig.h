/*
	qtparted - a frontend to libparted for manipulating disk partitions
	Copyright (C) 2002-2003 Vanni Brutto

	Vanni Brutto <zanac (-at-) libero dot it>

	This program is free software; you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation; either version 2 of the License, or
	(at your option) any later version.

	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with this program; if not, write to the Free Software
	Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
*/

/* About QP_dlgConfig class:
 *
 * This class is derived from QP_UIConfig that is made by designer. If you want to change
 * the layout of this dialog just use QT designer!
 *
 * This dialog is by the user to change some QTParte setting
 */

#ifndef QP_DLGCONFIG_H
#define QP_DLGCONFIG_H

#include "qtparted.h"
#include "qp_ui_config.ui.h"

class QP_dlgConfig : public Ui::QP_UIConfig {
	Q_OBJECT
public:
	QP_dlgConfig(QWidget *parent=0);
	~QP_dlgConfig();
	void init_dialog();	/*---init the dialog box   ---*/
	int show_dialog();	 /*---just show the dialog. ---*/
	int layout();		  /*---get the layout		---*/
	void setLayout(int);   /*---set the layout		---*/

protected slots:
	void slotToolChanged(int);			 /*---the user changed the tool in combobox  ---*/
	void slotPathChanged(const QString &); /*---the user changed the path			  ---*/
};

#endif
