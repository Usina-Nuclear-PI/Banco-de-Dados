CREATE DATABASE IF NOT EXISTS pi_usina;

USE pi_usina;

CREATE TABLE usuarios (
    id BIGINT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    senha VARCHAR(255) NOT NULL
);

CREATE TABLE arquivo_importacao (
    id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_usuario BIGINT NOT NULL,
    nome VARCHAR(255) NOT NULL,
    descricao VARCHAR(255),
    arquivo LONGBLOB NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id)
);

CREATE TABLE circuitos (
    id BIGINT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL
);

CREATE TABLE turnos (
    id BIGINT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE status_operacional (
    id BIGINT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL
);

CREATE TABLE monitoramento (
    id_registro BIGINT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    data_hora DATETIME NOT NULL,
    id_circuito BIGINT NOT NULL,
    id_turno BIGINT NOT NULL,
    id_status BIGINT NOT NULL,
    temperatura_c DECIMAL(10, 2),
    pressao_bar DECIMAL(10, 2),
    vazao_m3_h DECIMAL(10, 2),
    potencia_mw DECIMAL(10, 2),
    radiacao_msv_h DECIMAL(10, 4),
    vibracao_mm_s DECIMAL(10, 2),
    nivel_refrigerante_pct DECIMAL(5, 2),
    eficiencia_termica_pct DECIMAL(5, 2),
    id_arquivo BIGINT NOT NULL,
    id_usuario BIGINT NOT NULL,
    FOREIGN KEY (id_circuito) REFERENCES circuitos(id),
    FOREIGN KEY (id_turno) REFERENCES turnos(id),
    FOREIGN KEY (id_status) REFERENCES status_operacional(id),
    FOREIGN KEY (id_arquivo) REFERENCES arquivo_importacao(id),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id)
);
