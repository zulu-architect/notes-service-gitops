{{/* Labels that identify the app's pods. Used in the Deployment selector AND the Service selector, so they must stay stable. */}}
{{- define "notes-service.selectorLabels" -}}
app.kubernetes.io/name: notes-service
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/* Selector labels plus metadata labels (safe to change; not used for selection). */}}
{{- define "notes-service.labels" -}}
{{ include "notes-service.selectorLabels" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
{{- end }}
