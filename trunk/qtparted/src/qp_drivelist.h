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

/* About QP_DriveList class:
 *
 * This is a widget that display a tree of hard disk that are presents
 * in the computer. The widget will be used into QP_NavView.
 */

#ifndef QP_DRIVELIST_H
#define QP_DRIVELIST_H

#include <qaction.h>
#include <qlistview.h>
#include <qwidget.h>
#include <qptrlist.h>
#include <qpopupmenu.h>
#include "qp_devlist.h"

class QP_DeviceNode {
public:
    QAction *action;
    QListViewItem *listitem;
};

class QP_DriveList : public QListView {
    Q_OBJECT

public:
    QP_DriveList(QWidget *parent=0, const char *name=0, QP_Settings *settings=0);
    ~QP_DriveList();
    void setPopup(QPopupMenu *); /*---set the popup menu (right click)---*/
    void buildView();
    QListViewItem *addDevice(QString, QListViewItem *);
    QActionGroup *agDevices();
    QP_Device *selDevice(); /*---return the selected device---*/

private:
    QActionGroup *_agDevices;
    QP_DevList *devlist;
    QPopupMenu *_popup;
    QP_Device *_selDevice;

signals:
    void sigSelectDevice(QP_Device *);
    void onItem(QString);

public slots:
    void slotListSelected(QListViewItem *);
    void slotActionSelected(QAction *);
    void slotPopUp(QListViewItem *, const QPoint &, int);
};

#endif
