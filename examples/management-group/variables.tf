variable "management_group" {
  type = list(object({
    parent           = optional(string, null)
    name             = string
    subscription_ids = optional(list(string), [])
  }))
  default = [{
    parent = null
    name   = "mg1"
    }, {
    parent = "mg1"
    name   = "mg2"
    }, {
    parent           = "mg2"
    name             = "mg3"
    subscription_ids = []
  }]
}