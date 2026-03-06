# Olist Data Warehouse & BI Analytics

Projeto de **Data Warehouse e Business Intelligence** utilizando o dataset público de e-commerce brasileiro **Olist**.

O objetivo do projeto é transformar dados operacionais em **informações analíticas**, permitindo analisar desempenho de vendas, eficiência logística e comportamento do cliente.

---

## Perguntas de Negócio

O projeto busca responder perguntas como:

* Qual o volume total de vendas do marketplace?
* Como está o desempenho logístico das entregas?
* Quais vendedores apresentam maior taxa de atraso?
* Quais categorias de produtos geram mais receita?
* Em quais estados estão concentradas as vendas?

---

## Arquitetura do Projeto

O pipeline analítico foi estruturado em camadas:

```
RAW → STAGING → DATA WAREHOUSE → ANALYTICS → BI
```

* **RAW** – dados brutos do dataset
* **STAGING** – limpeza e preparação dos dados
* **DW** – modelagem dimensional (modelo estrela)
* **ANALYTICS** – views analíticas em SQL
* **BI** – visualização interativa no Power BI

---

## Modelagem de Dados

Modelo dimensional composto por:

**Dimensões**

* dim_cliente
* dim_produto
* dim_calendario

**Fato**

* fato_pedido

---

## Dashboard Power BI

O dashboard apresenta indicadores importantes de negócio:

**KPIs**

* Receita Total
* Total de Pedidos
* Lead Time Médio
* Taxa de Atraso
* Custo Total de Frete

**Visualizações**

* evolução da receita
* taxa de atraso logístico
* ranking de vendedores com maior atraso
* categorias de produtos com maior faturamento
* distribuição geográfica das vendas

---

## Interatividade

As imagens no repositório são **prints do dashboard**, porém o relatório em Power BI é **interativo**, permitindo explorar os dados e visualizar detalhes ao passar o mouse sobre os gráficos.

---

## Tecnologias Utilizadas

* SQL
* PostgreSQL
* Power BI
* Git / GitHub

---

## Dataset

Olist Brazilian E-commerce Dataset
https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce
