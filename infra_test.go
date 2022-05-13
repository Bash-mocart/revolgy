package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestTerraformInfraTest(t *testing.T) {
	// retryable errors in terraform testing.
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "./staging",
	})

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)
	// saving terraform outputs in variables
	s3_output := terraform.Output(t, terraformOptions, "s3_tag")
	instance_tag_output := terraform.Output(t, terraformOptions, "instance_tag")
	// checking the resources are properly tagged
	assert.Equal(t, "map[Name:Flugel Owner:InfraTeam]", s3_output)
	assert.Equal(t, "map[Name:Flugel Owner:InfraTeam]", instance_tag_output)
}
