{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "mammatus.keda.trigger_authentication" -}}
{{- $deploymentName := .name }}
{{- range $index, $trigger := .arguments.triggers }}
{{- if .authenticationRef }}
---
apiVersion: keda.sh/v1alpha1
kind: TriggerAuthentication
metadata:
  name: {{ $deploymentName }}-{{ $index }}
spec:
  {{- (dict "secretTargetRef" (list .authenticationRef))|toYaml|nindent 2 }}
{{- end }}
{{- end }}
{{- end }}
