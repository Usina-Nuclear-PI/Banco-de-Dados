
-- Reabilitar verificações
SET FOREIGN_KEY_CHECKS = 1;
COMMIT;

-- Verificar resultado
SELECT 'Inserts concluídos com sucesso!' AS Status;
SELECT
    'usuarios' AS tabela, COUNT(*) AS total FROM usuarios
UNION ALL
SELECT 'circuitos', COUNT(*) FROM circuitos
UNION ALL
SELECT 'turnos', COUNT(*) FROM turnos
UNION ALL
SELECT 'status_operacional', COUNT(*) FROM status_operacional
UNION ALL
SELECT 'arquivo_importacao', COUNT(*) FROM arquivo_importacao
UNION ALL
SELECT 'monitoramento', COUNT(*) FROM monitoramento;
