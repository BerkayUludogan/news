enum ProductServicePath {
  news(
    'v1/company-news?symbol=AAPL&from=2023-08-15&to=2024-09-06&token=crbln89r01qtpc70rba0crbln89r01qtpc70rbag',
  );

  const ProductServicePath(this.value);

  final String value;
}
