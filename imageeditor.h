//nic tu nie ma - upadła koncepcja tworzenia tej klasy (na tą chwilę)



#ifndef IMAGEEDITOR_H
#define IMAGEEDITOR_H


#include "imageclass.h"
#include <QObject>
#include <QPixmap>
#include <QImage>

class ImageEditor : public QQuickImageProvider
{
public:
    ImageEditor()
                   : QQuickImageProvider(QQuickImageProvider::Pixmap)
        {
        }

    QPixmap requestPixmap(const QString &id, QSize *size, const QSize &requestedSize) override
        {
           int width = 100;
           int height = 50;

           if (size)
              *size = QSize(width, height);
           QPixmap pixmap(requestedSize.width() > 0 ? requestedSize.width() : width,
                          requestedSize.height() > 0 ? requestedSize.height() : height);
           pixmap.fill(QColor(id).rgba());
           return pixmap;
        }

private:
    QPixmap img;
};

#endif // IMAGEEDITOR_H
