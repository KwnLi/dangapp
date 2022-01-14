rm1table <- data.frame(
  effectcode = c("str", "exppwr", "pwrend", "end"),
  effect = c("strength", "explosive power", "power endurance", "endurance"),
  pcrm1_low = c(0.85, 0.75, 0.65, 0.55),
  pcrm1_hi = c(0.95, NA, NA, 0.65),
  reps = c("6 to 3", "10 to 6", "20 to 10", "35 to 20"),
  totreps = c("10 (6-14)", "15 (10-20)", "18 (12-24)", "24 (18-30)")
)


rmcalc <- function(effect, rm1){
  c.row = which(rm1table$effectcode == effect)
  wtlo = round(rm1table$pcrm1_low[c.row]*rm1, 0)
  wthi = round(rm1table$pcrm1_hi[c.row]*rm1, 0)
  
  wtrange = paste(wtlo,
                  ifelse(is.na(wthi), "",
                         paste(" to ", wthi, sep = "")),
                  " lbs", sep = "")
  
  excmessg = paste("Lift", wtrange, "at", rm1table$reps[c.row],
                   "reps for a total of", rm1table$totreps[c.row],
                   "reps.", sep = " ")
  return(excmessg)
}
