Feature: HU001 - Cronograma inteligente de mantenimiento

    Como dueño de un vehiculo particular, 
    Quiero un cronograma inteligente de mantenimiento que se adapte al historial de mi vehiculo,
    Para prevenir averias y accidentes.

    Scenario Outline: Visualizar cronograma personalizado
        Given que soy dueño de un <vehiculo> ingresado en la aplicacion
        When <consulte> la aplicacion
        Then quiero ver un <cronograma de mantenimiento> adaptado al <historial mi vehiculo>
        
        Example: INPUT
            | vehiculo        | consulta                  | historial mi vehiculo          |
            | Toyota Corolla  | proxima revision tecnica  | motor cambiado hace 1 año      |
            | Honda Civic     | estado de motor           | frenos cambiado ayer           |
            | Ford Focus      | presion de llantas        | neumaticos nuevos hace 6 meses |

        Example: OUTPUT
            | estado del vehiculo                | cronograma de mantenimiento                     |
            | revision tecnica al dia            | proxima revision en 6 meses                     |
            | motor con desgaste moderado        | cambio de aceite recomendado en 3 meses         |
            | presion de llantas baja            | inflado de llantas recomendado en 1 semana      |

    Scenario Outline: Recibir alertas de mantenimiento
        Given que soy dueño de un <vehiculo> ingresado en la aplicacion
        When se acerque la <fecha> de mantenimiento
        Then recibire una <notificacion> automatica
        Example: INPUT
            | vehiculo        | fecha de mantenimiento    |
            | Toyota Corolla  | 2024-07-15                |
            | Honda Civic     | 2024-08-01                |
            | Ford Focus      | 2024-09-10                |
        Example: OUTPUT
            | notificacion                             |
            | Recordatorio: Proxima revision tecnica  |
            | Alerta: Estado del motor a revisar      |
            | Aviso: Presion de llantas baja          |