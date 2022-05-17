package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestTerraformInfraTest(t *testing.T) {
	// retryable errors in terraform testing.
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "./testing",
		// Vars: map[string]interface{}{
		// 	"db_username": "test",
		// 	"db_password": "test",
		// 	// "eggs": struct {
		// 	//   source string
		// 	//   price  float64
		// 	// }{"chicken", 1.75},s
		// 	// "steak": true,
		// },
	})

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)
	// // saving terraform outputs in variables
	// s3_output := terraform.Output(t, terraformOptions, "s3_tag")
	// instance_tag_output := terraform.Output(t, terraformOptions, "instance_tag")
	// // checking the resources are properly tagged
	// assert.Equal(t, "map[Name:Flugel Owner:InfraTeam]", s3_output)
	// assert.Equal(t, "map[Name:Flugel Owner:InfraTeam]", instance_tag_output)
}
