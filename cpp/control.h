#ifndef CONTROL
#define CONTROL

#include <QObject>
#include <QNetworkReply>
#include <QNetworkAccessManager>

class Control : public QObject{
    Q_OBJECT
public:
    Control();
    ~Control();

signals:
    void info(QString str);

public slots:
    void replyFinished(QNetworkReply *reply);

    void reboot();

private:
    QNetworkAccessManager* manager;
};

#endif // CONTROL

