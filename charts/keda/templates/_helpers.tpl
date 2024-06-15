{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "mammatus.keda.deployment" -}}
{{- include "mammatus.keda.scaled_object" . }}
{{- include "mammatus.keda.trigger_authentication" . }}
{{- end -}}
