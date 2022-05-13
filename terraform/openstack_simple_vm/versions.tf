terraform {
  cloud {
    organization = "tibeer"

    workspaces {
      name = "betacloud"
    }
  }
}
