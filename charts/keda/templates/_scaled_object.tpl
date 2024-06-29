{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "mammatus.keda.scaled_object" -}}
{{- $deploymentName := .name }}
---
apiVersion: keda.sh/v1alpha1
kind: ScaledObject
metadata:
  name: {{ .name }}
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: {{ .name }}
  idleReplicaCount: {{ .arguments.idleReplicaCount }}
  minReplicaCount: {{ .arguments.minReplicaCount }}
  maxReplicaCount: {{ .arguments.maxReplicaCount }}
  cooldownPeriod: {{ .arguments.cooldownPeriod }}
  advanced: {{ .arguments.advanced|toYaml|nindent 4 }}
  triggers:
{{- range $index, $trigger := .arguments.triggers }}
    - type: {{ $trigger.type }}
      metadata: {{ $trigger.metadata|toYaml|nindent 8 }}
      authenticationRef:
        name: {{ $deploymentName }}-{{ $index }}
{{- end }}
{{- end -}}
