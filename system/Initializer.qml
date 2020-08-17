import QtQuick 2.9

Item {
    states: [
        State {
            name: "hardware_init"
            when: system.stateMachine.Init
            StateChangeScript {
                script: {
                    system.stateMachine.submitEvent("initDone")
                }
            }
        }
    ]
}
