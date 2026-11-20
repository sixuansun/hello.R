# 与 docs/component.typ 第 2.4 节的手算示例一致
y <- c(10, 12, 14, 20, 24, 28)
t_mmdd <- c(101, 101, 101, 201, 201, 201)

test_that("RemoveSeasonal() 的 mu 与 anomaly 与手算一致", {
  res <- RemoveSeasonal(y, t_mmdd)

  expect_equal(res$mu, c(12, 24))                 # (10+12+14)/3, (20+24+28)/3
  expect_equal(res$anomaly, c(-2, 0, 2, -4, 0, 4)) # 逐观测减去所属季节均值
  expect_equal(res$anomaly + res$mu[match(t_mmdd, sort(unique(t_mmdd)))], y)
})

test_that("RemoveSeasonal() 对输入顺序与分组顺序无关", {
  idx <- c(4, 5, 6, 1, 2, 3) # 打乱观测顺序
  res <- RemoveSeasonal(y[idx], t_mmdd[idx])

  expect_equal(res$mu, c(12, 24))                          # mu 仍按 MMDD 升序
  expect_equal(res$anomaly, c(-2, 0, 2, -4, 0, 4)[idx])
})

test_that("RemoveSeasonal() 对 NA 的处理", {
  y_na <- c(10, NA, 14, 20, 24, 28)
  res <- RemoveSeasonal(y_na, t_mmdd)

  expect_equal(res$mu, c(12, 24)) # 组内 na.rm = TRUE
  expect_true(is.na(res$anomaly[2]))
  expect_equal(res$anomaly[-2], c(-2, 2, -4, 0, 4))
})
