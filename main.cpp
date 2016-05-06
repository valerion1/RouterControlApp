#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "cpp/control.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QQmlApplicationEngine engine;

    Control* control = new Control();

    QQmlContext* context = engine.rootContext();

    context->setContextProperty("router", control);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}

