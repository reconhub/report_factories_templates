
path <- here::here("data", "rds", "compute_risk.rds")
if (file.exists(path)) {
  risk_calculator <- readRDS(path)
}
