Feature: HU026 - Eficiencia del flujo de usuario

  Como dueño de una empresa de transporte,
  Quiero que en el inicio de la aplicación se centralicen los servicios que más usaré,
  Para aumentar mi eficiencia dentro del flujo.


  Scenario Outline: Mostrar menú principal optimizado
    Given que he iniciado sesión
    When paso o ignoro el tutorial
    Then veré el <panel_principal> con accesos rápidos

    Examples: INPUT
      | panel_principal                 |
      | "Panel: Seguimiento, Cronograma" |
      | "Panel: Alertas, Historial"      |

    Examples: OUTPUT
      | panel_visible                 |
      | "Panel: Seguimiento, Cronograma" |
      | "Panel: Alertas, Historial"      |

  Scenario Outline: Personalizar tamaño y orden del menú
    Given que personalizo mi inicio
    When selecciono los servicios preferidos
    Then el sistema aplicará la configuración <configuracion>

    Examples: INPUT
      | configuracion          |
      | "Priorizar Seguimiento"|
      | "Ampliar Cronograma"   |

    Examples: OUTPUT
      | resultado                     |
      | "Inicio personalizado guardado" |
      | "Inicio personalizado guardado" |



Feature: HU027 - Registro de clientes con GNV o GLP

  Como dueño de un taller mecánico,
  Quiero registrar qué clientes usan GNV o GLP,
  Para recomendar mantenimientos específicos.


  Scenario Outline: Registrar tipo de combustible
    Given que estoy creando un cliente
    When ingreso el tipo <tipo_combustible>
    Then el sistema guardará el dato correctamente

    Examples: INPUT
      | tipo_combustible |
      | "GNV"            |
      | "GLP"            |

    Examples: OUTPUT
      | confirmacion                  |
      | "Cliente registrado con GNV"  |
      | "Cliente registrado con GLP"  |

  Scenario Outline: Filtrar clientes por tipo de combustible
    Given que tengo clientes registrados
    When filtro por <tipo_combustible>
    Then solo veré los que cumplen esa categoría

    Examples: INPUT
      | tipo_combustible |
      | "GNV"            |
      | "GLP"            |

    Examples: OUTPUT
      | lista_filtrada     |
      | "5 clientes GNV"   |
      | "3 clientes GLP"   |

Feature: HU028 - Estadísticas de fallas comunes en la región

  Como dueño de un taller mecánico,
  Quiero ver estadísticas de fallas comunes,
  Para anticipar qué repuestos necesitaré.

  Scenario Outline: Consultar estadísticas por región
    Given que ingreso al módulo de estadísticas
    When selecciono la región <region>
    Then veré las fallas frecuentes <fallas>
    Examples: INPUT
      | region   |
      | "Lima"   |
      | "Callao" |
    Examples: OUTPUT
      | fallas                               |
      | "Fuga aceite 20%, Frenos 15%"         |
      | "Bujías 12%, Suspensión 8%"           |

  Scenario Outline: Sugerir repuestos según estadísticas
    Given que el sistema detecta fallas en la región <region>
    When solicito recomendaciones
    Then veré <repuestos_sugeridos>
    Examples: INPUT
      | region   |
      | "Lima"   |
      | "Callao" |
    Examples: OUTPUT
      | repuestos_sugeridos          |
      | "junta culata, pastillas"    |
      | "bujías, filtros"            |

Feature: HU029 - Comparador inteligente de repuestos y servicios
  Como dueño de vehículo,
  Quiero comparar precios entre talleres,
  Para elegir la opción más conveniente.

  Scenario Outline: Comparar precios de repuestos
    Given que busco el repuesto <repuesto>
    When accedo al comparador
    Then veré la lista <lista_precios>
    Examples: INPUT
      | repuesto        |
      | "Filtro aire"   |
      | "Pastillas"     |
    Examples: OUTPUT
      | lista_precios                               |
      | "TallerA:45, TallerB:50, TallerC:60"         |
      | "TallerB:110, TallerA:120"                   |

  Scenario Outline: Comparar servicios con reputación
    Given que necesito un servicio mecánico
    When aplico el criterio <criterio>
    Then veré <resultado>
    Examples: INPUT
      | criterio     |
      | "precio"     |
      | "reputacion" |
    Examples: OUTPUT
      | resultado                                |
      | "CambioAceite - TallerA (S/30) - 4.2★"    |
      | "CambioAceite - TallerB (S/35) - 4.8★"    |

Feature: HU030 - Notificaciones de mantenimientos críticos
  Como dueño de vehículo particular,
  Quiero recibir alertas sobre mantenimientos críticos,
  Para evitar fallas costosas.

  Scenario Outline: Enviar alerta por kilometraje crítico
    Given que el vehículo alcanza <km_critico>
    When se evalúan las condiciones
    Then el sistema enviará <detalle_alerta>
    Examples: INPUT
      | km_critico |
      | 100000     |
      | 80000      |
    Examples: OUTPUT
      | detalle_alerta                 |
      | "Revisión transmisión"         |
      | "Cambio de correa"             |

  Scenario Outline: Ajustar historial luego del mantenimiento
    Given que registro el mantenimiento crítico <mantenimiento>
    When el técnico ingresa la información
    Then el sistema actualizará el programa <nuevo_programa>
    Examples: INPUT
      | mantenimiento       |
      | "Cambio de caja"    |
      | "Reparación frenos" |
    Examples: OUTPUT
      | nuevo_programa              |
      | "Próxima alerta: 120000 km" |
      | "Próxima alerta: 90000 km"  |

Feature: HU031 - Historial completo de intervenciones mecánicas
  Como dueño de un vehículo particular,
  Quiero consultar un historial completo de intervenciones mecánicas,
  Para conocer todo lo realizado previamente.

  Scenario Outline: Mostrar historial del vehículo
    Given que accedo al historial
    When selecciono el vehículo
    Then veré el detalle <mantenimiento>
    Examples: INPUT
      | mantenimiento         |
      | "Cambio de aceite"    |
      | "Afinamiento general" |
    Examples: OUTPUT
      | historial_mostrado    |
      | "Cambio de aceite"    |
      | "Afinamiento general" |

  Scenario Outline: Filtrar historial por categoría
    Given que tengo un historial extenso
    When aplico el filtro <categoria>
    Then solo veré registros de esa categoría
    Examples: INPUT
      | categoria |
      | "Motor"   |
      | "Frenos"  |
    Examples: OUTPUT
      | resultado_filtrado |
      | "Registros Motor"  |
      | "Registros Frenos" |

Feature: HU032 - Recomendaciones personalizadas de talleres cercanos
  Como dueño de un vehículo particular,
  Quiero recibir recomendaciones de talleres confiables,
  Para elegir opciones cercanas según mis necesidades.

  Scenario Outline: Mostrar talleres cercanos
    Given que activo la geolocalización
    When se detecta mi ubicación
    Then veré talleres como <taller>
    Examples: INPUT
      | taller            |
      | "Taller Rayo"     |
      | "Mecánica Express"|
    Examples: OUTPUT
      | taller_visible    |
      | "Taller Rayo"     |
      | "Mecánica Express"|

  Scenario Outline: Ordenar talleres por criterio
    Given que tengo una lista de talleres sugeridos
    When aplico el criterio <criterio>
    Then la lista será ordenada correctamente
    Examples: INPUT
      | criterio     |
      | "precio"     |
      | "reputación" |
    Examples: OUTPUT
      | resultado_lista       |
      | "Ordenado por precio" |
      | "Ordenado por reputación" |

Feature: HU033 - Análisis comparativo de precios de proveedores
  Como dueño de un taller mecánico,
  Quiero comparar precios entre proveedores,
  Para optimizar mis compras de inventario.

  Scenario Outline: Comparar precios de un repuesto
    Given que ingreso al módulo de proveedores
    When selecciono el repuesto <repuesto>
    Then veré la lista de precios <lista_precios>
    Examples: INPUT
      | repuesto        |
      | "Bujías"        |
      | "Filtro aceite" |
    Examples: OUTPUT
      | lista_precios                   |
      | "ProvA:20, ProvB:18, ProvC:22"  |
      | "ProvA:30, ProvB:28, ProvC:32"  |

  Scenario Outline: Identificar proveedor óptimo
    Given que se completó la comparación
    When solicito la recomendación
    Then el sistema sugerirá <proveedor_optimo>
    Examples: INPUT
      | proveedor_optimo |
      | "ProvB"          |
      | "ProvA"          |
    Examples: OUTPUT
      | proveedor_sugerido |
      | "ProvB"            |
      | "ProvA"            |

Feature: HU034 - Calendario centralizado de mantenimientos
  Como dueño de un taller mecánico,
  Quiero visualizar un calendario con mantenimientos agendados,
  Para organizar la carga de trabajo.

  Scenario Outline: Mostrar mantenimientos en el calendario
    Given que accedo al calendario
    When cargo las actividades del día
    Then veré <actividad>
    Examples: INPUT
      | actividad           |
      | "Cambio aceite 9am" |
      | "Revisión 3pm"      |
    Examples: OUTPUT
      | actividad_listada   |
      | "Cambio aceite 9am" |
      | "Revisión 3pm"      |

  Scenario Outline: Filtrar calendario por estado
    Given que tengo varias actividades
    When aplico el filtro <estado>
    Then veré solo actividades del mismo estado
    Examples: INPUT
      | estado      |
      | "Pendiente" |
      | "En curso"  |
    Examples: OUTPUT
      | actividades_filtradas |
      | "Pendientes"          |
      | "En curso"            |

  
Feature: HU035 - Cálculo de costo total de propiedad de unidades
  Como dueño de una empresa de transporte,
  Quiero calcular el costo total de propiedad de cada unidad incluyendo repuestos, mantenimiento y seguros,
  Para optimizar la inversión y mejorar la rentabilidad de la flota.

  Scenario Outline: Registro de costos asociados
    Given tengo una unidad registrada
    When ingrese gastos de repuestos, mantenimiento y seguros
    Then se sumarán al costo total <costo_total>
    Examples: INPUT
      | costo_total |
      | 2500        |
      | 3800        |
    Examples: OUTPUT
      | costo_total_actualizado |
      | 2500                    |
      | 3800                    |

  Scenario Outline: Reporte de rentabilidad por unidad
    Given consultó el sistema
    When genere un informe
    Then veré la rentabilidad y costo acumulado <rentabilidad>
    Examples: INPUT
      | rentabilidad |
      | "Rentable"   |
      | "No rentable"|
    Examples: OUTPUT
      | resultado_reporte |
      | "Rentable"        |
      | "No rentable"     |


Feature: HU036 - Control de notificaciones en la aplicación
  Como dueño de un taller mecánico,
  Quiero controlar el tipo de notificaciones que voy a recibir,
  Para evitarme falsas alarmas.

  Scenario Outline: Nivel de riesgo de notificaciones
    Given soy dueño de un taller mecánico
    When esté esperando una notificación de un vehículo
    Then tengo que poder editar el nivel de notificaciones que desee obtener <nivel>
    Examples: INPUT
      | nivel       |
      | "Alto"      |
      | "Medio"     |
    Examples: OUTPUT
      | nivel_configurado |
      | "Alto"            |
      | "Medio"           |

  Scenario Outline: Maneras de notificación
    Given soy dueño de un taller mecánico
    When esté esperando una notificación de un vehículo
    Then tengo que poder poner el tipo de notificación que voy a recibir <tipo>
    Examples: INPUT
      | tipo    |
      | "SMS"   |
      | "Email" |
    Examples: OUTPUT
      | tipo_configurado |
      | "SMS"            |
      | "Email"          |

Feature: HU037 - Recomendaciones de stock de repuestos
  Como dueño de un taller mecánico,
  Quiero recibir recomendaciones de stock de repuestos,
  Para optimizar inventario y reducir retrasos en reparaciones.

  Scenario Outline: Sugerencia de reposición
    Given un repuesto tiene alta demanda
    When el stock esté bajo
    Then el sistema sugerirá reponerlo <repuesto>
    Examples: INPUT
      | repuesto         |
      | "Filtro aceite"  |
      | "Bujías"         |
    Examples: OUTPUT
      | sugerencia       |
      | "Reponer filtro" |
      | "Reponer bujías" |

  Scenario Outline: Informe de pronóstico de stock
    Given consultó la aplicación
    When genere un reporte
    Then veré los repuestos más demandados para el próximo trimestre <reporte>
    Examples: INPUT
      | reporte          |
      | "Top 5 repuestos"|
      | "Demanda alta"   |
    Examples: OUTPUT
      | reporte_generado |
      | "Top 5 repuestos"|
      | "Demanda alta"   |

Feature: HU038 - Estimado de costos futuros de mantenimiento
  Como dueño de un vehículo particular,
  Quiero que la app me muestre un estimado de costos futuros,
  Para planificar mejor mis gastos.

  Scenario Outline: Proyección de costos por kilometraje
    Given registro mi kilometraje mensual
    When el sistema calcule
    Then mostrará un estimado de mantenimiento futuro <estimado>
    Examples: INPUT
      | estimado |
      | "S/300"  |
      | "S/520"  |
    Examples: OUTPUT
      | estimado_generado |
      | "S/300"           |
      | "S/520"           |

  Scenario Outline: Visualización en gráfico
    Given quiero ver mis costos futuros
    When consulte en la app
    Then aparecerá un gráfico con las proyecciones <grafico>
    Examples: INPUT
      | grafico           |
      | "Línea"           |
      | "Barras"          |
    Examples: OUTPUT
      | grafico_mostrado  |
      | "Línea"           |
      | "Barras"          |

Feature: HU039 - Consejos de conducción eficiente
  Como conductor particular,
  Quiero recibir consejos de conducción eficiente dentro de la app,
  Para reducir consumo de combustible y desgaste del vehículo.

  Scenario Outline: Notificación de consejos
    Given conduzco de manera ineficiente
    When el sistema detecte patrones de alto consumo
    Then me enviará recomendaciones <consejo>
    Examples: INPUT
      | consejo                    |
      | "Evita frenadas bruscas"   |
      | "Mantén velocidad estable" |
    Examples: OUTPUT
      | consejo_enviado          |
      | "Evita frenadas bruscas" |
      | "Mantén velocidad estable" |

  Scenario Outline: Registro de eficiencia
    Given aplicó las recomendaciones
    When mejore mi conducción
    Then el sistema actualizará mi puntaje de eficiencia <puntaje>
    Examples: INPUT
      | puntaje |
      | 80      |
      | 92      |
    Examples: OUTPUT
      | puntaje_actualizado |
      | 80                  |
      | 92                  |

Feature: HU040 - Registro de fotos de averías
  Como usuario particular,
  Quiero guardar fotos de piezas dañadas o averías,
  Para mostrar al taller el problema antes de llevar el auto.

  Scenario Outline: Subida de foto
    Given tengo una avería
    When tome una foto en la app
    Then esta se guardará con fecha y descripción <foto>
    Examples: INPUT
      | foto        |
      | "fuga1.jpg" |
      | "rueda.png" |
    Examples: OUTPUT
      | foto_guardada |
      | "fuga1.jpg"   |
      | "rueda.png"   |

  Scenario Outline: Envío al taller
    Given seleccionó un taller
    When comparta la avería
    Then el taller recibirá las imágenes adjuntas <archivo>
    Examples: INPUT
      | archivo        |
      | "fuga1.jpg"    |
      | "motor.png"    |
    Examples: OUTPUT
      | archivo_enviado |
      | "fuga1.jpg"     |
      | "motor.png"     |

Feature: HU041 - Puntaje de salud del vehículo
  Como dueño de un vehículo particular,
  Quiero recibir un puntaje de salud del auto,
  Para saber su estado general.

  Scenario Outline: Cálculo del puntaje
    Given registro mis mantenimientos
    When consulte el sistema
    Then veré un puntaje actualizado de salud del vehículo <puntaje>
    Examples: INPUT
      | puntaje |
      | 75      |
      | 90      |
    Examples: OUTPUT
      | puntaje_mostrado |
      | 75               |
      | 90               |

  Scenario Outline: Visualización rápida
    Given abro la app
    When esté en el inicio
    Then el puntaje de salud aparecerá en la pantalla principal <puntaje>
    Examples: INPUT
      | puntaje |
      | 75      |
      | 90      |
    Examples: OUTPUT
      | puntaje_visible |
      | 75              |
      | 90              |

Feature: HU042 - Alertas por kilometraje crítico
  Como administrador de flota,
  Quiero que el sistema genere alertas por kilometraje crítico,
  Para programar mantenimientos correctamente.

  Scenario Outline: Notificación automática por kilometraje
    Given una unidad alcanza un kilometraje crítico
    When esto ocurra
    Then recibiré una alerta en el sistema <alerta>
    Examples: INPUT
      | alerta               |
      | "Revisión frenos"    |
      | "Cambio aceite"      |
    Examples: OUTPUT
      | alerta_generada      |
      | "Revisión frenos"    |
      | "Cambio aceite"      |

  Scenario Outline: Registro en historial
    Given se genere la alerta
    When se revise el historial
    Then quedará guardado como referencia <registro>
    Examples: INPUT
      | registro     |
      | "Alerta 001" |
      | "Alerta 002" |
    Examples: OUTPUT
      | historial_registrado |
      | "Alerta 001"         |
      | "Alerta 002"         |

Feature: HU043 - Comparación de rendimiento de unidades
  Como dueño de empresa de transporte,
  Quiero comparar el rendimiento de cada unidad,
  Para decidir qué vehículos renovar primero.

  Scenario Outline: Reporte comparativo
    Given consulto la flota
    When genere un reporte
    Then veré el rendimiento de cada unidad <rendimiento>
    Examples: INPUT
      | rendimiento                 |
      | "U1: Alto consumo"          |
      | "U2: Buen rendimiento"      |
    Examples: OUTPUT
      | reporte_generado           |
      | "U1: Alto consumo"         |
      | "U2: Buen rendimiento"     |

  Scenario Outline: Sugerencia de renovación
    Given algunas unidades son ineficientes
    When consulte el análisis
    Then el sistema recomendará cuáles renovar <sugerencia>
    Examples: INPUT
      | sugerencia  |
      | "Renovar U1"|
      | "Renovar U3"|
    Examples: OUTPUT
      | recomendacion |
      | "Renovar U1"  |
      | "Renovar U3"  |

Feature: HU044 - Centralización de facturas y comprobantes
  Como gestor de transporte,
  Quiero que el sistema centralice facturas y comprobantes,
  Para simplificar la gestión contable.

  Scenario Outline: Registro de comprobante
    Given realizó un mantenimiento
    When se registre
    Then el comprobante se almacenará <archivo>
    Examples: INPUT
      | archivo           |
      | "factura1.pdf"    |
      | "mantenimiento2"  |
    Examples: OUTPUT
      | archivo_guardado |
      | "factura1.pdf"   |
      | "mantenimiento2" |

  Scenario Outline: Consulta centralizada
    Given busco un comprobante
    When consulte por fecha o unidad
    Then el sistema lo mostrará <resultado>
    Examples: INPUT
      | resultado     |
      | "factura1"    |
      | "factura2"    |
    Examples: OUTPUT
      | comprobante_mostrado |
      | "factura1"           |
      | "factura2"           |

Feature: HU045 - Visualización en mapa de unidades en taller
  Como administrador de flota,
  Quiero ver en un mapa qué unidades están en taller,
  Para mejorar la asignación de rutas.

  Scenario Outline: Identificación en mapa
    Given consulto la app
    When abra el mapa
    Then se mostrarán las unidades en taller y activas <estado>
    Examples: INPUT
      | estado          |
      | "U1 en taller"  |
      | "U2 activa"     |
    Examples: OUTPUT
      | estado_visible  |
      | "U1 en taller"  |
      | "U2 activa"     |

  Scenario Outline: Actualización en tiempo real
    Given cambia el estado de una unidad
    When salga o entre a taller
    Then el mapa se actualizará automáticamente <actualizacion>
    Examples: INPUT
      | actualizacion    |
      | "U1 salió"       |
      | "U3 entró"       |
    Examples: OUTPUT
      | mapa_actualizado |
      | "U1 salió"       |
      | "U3 entró"       |

Feature: HU046 - Registro de tiempos promedio de reparaciones
  Como jefe de taller,
  Quiero registrar tiempos promedio de reparaciones,
  Para mejorar la estimación hacia los clientes.

  Scenario Outline: Registro de tiempos
    Given se realiza una reparación
    When se registre
    Then el tiempo quedará guardado <tiempo>
    Examples: INPUT
      | tiempo |
      | "2h"   |
      | "3h"   |
    Examples: OUTPUT
      | tiempo_registrado |
      | "2h"              |
      | "3h"              |

  Scenario Outline: Estimación para clientes
    Given un cliente pide un servicio
    When consulte
    Then se le mostrará el tiempo promedio <promedio>
    Examples: INPUT
      | promedio |
      | "2h"     |
      | "4h"     |
    Examples: OUTPUT
      | promedio_mostrado |
      | "2h"              |
      | "4h"              |

Feature: HU047 - Comunicación visual con clientes
  Como mecánico,
  Quiero enviar fotos y videos del proceso al cliente,
  Para generar confianza y transparencia.

  Scenario Outline: Envío de fotos y videos
    Given realizo una reparación
    When suba imágenes o videos
    Then el cliente podrá visualizarlos <archivo>
    Examples: INPUT
      | archivo        |
      | "avance1.jpg"  |
      | "video1.mp4"   |
    Examples: OUTPUT
      | archivo_enviado |
      | "avance1.jpg"   |
      | "video1.mp4"    |

  Scenario Outline: Notificación al cliente
    Given estoy subiendo material multimedia
    When se cargue correctamente
    Then el cliente recibirá una notificación inmediata <notificacion>
    Examples: INPUT
      | notificacion         |
      | "Archivo disponible" |
      | "Nuevo progreso"     |
    Examples: OUTPUT
      | notificacion_enviada |
      | "Archivo disponible" |
      | "Nuevo progreso"     |

Feature: HU048 - Eficiencia de ingreso de datos de la unidad
  Como dueño de una empresa de transporte,
  Quiero ingresar rápidamente los datos de mi vehículo,
  Para poder registrar cada unidad sin demora.

  Scenario Outline: Escáner de vehículo
    Given soy dueño de una empresa de transporte con muchas unidades
    When tenga que ingresar los datos de los vehículos
    Then conectando mi celular al vehículo podré automatizar el registro <dato>
    Examples: INPUT
      | dato             |
      | "VIN detectado"  |
      | "Modelo leído"   |
    Examples: OUTPUT
      | dato_registrado |
      | "VIN detectado" |
      | "Modelo leído"  |

Feature: HU049 - Gestión de actualizaciones del sistema
  Como dueño de un taller mecánico,
  Quiero gestionar las actualizaciones del sistema desde un menú,
  Para mantener la app segura y actualizada.

  Scenario Outline: Buscar instalaciones del sistema
    Given que soy dueño de un taller mecánico y estoy en configuraciones
    When presione el botón "Buscar actualizaciones"
    Then el sistema debe buscar actualizaciones disponibles <resultado>
    Examples: INPUT
      | resultado           |
      | "Actualización lista" |
      | "Sistema actualizado" |
    Examples: OUTPUT
      | estado_actualizacion |
      | "Actualización lista"|
      | "Sistema actualizado"|

Feature: HU050 - Consulta de reportes en PDF
  Como usuario de FastEngine,
  Quiero visualizar y acceder a reportes mensuales en PDF,
  Para analizar el rendimiento de mi flota.

  Scenario Outline: Visualizar reporte general en PDF
    Given soy usuario de FastEngine y estoy en informes generales
    When despliegue la lista y seleccione un período disponible
    Then el sistema entregará el informe en PDF <reporte>
    Examples: INPUT
      | reporte         |
      | "Marzo2025"     |
      | "Abril2025"     |
    Examples: OUTPUT
      | pdf_generado        |
      | "Marzo2025.pdf"     |
      | "Abril2025.pdf"     |
