{{/*
Expand the name of the chart.
*/}}
{{- define "openproject.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "openproject.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "openproject.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "openproject.labels" -}}
helm.sh/chart: {{ include "openproject.chart" . }}
{{ include "openproject.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "openproject.selectorLabels" -}}
app.kubernetes.io/name: {{ include "openproject.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "openproject.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "openproject.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Fully qualified PostgreSQL service name.
*/}}
{{- define "openproject.postgresql.fullname" -}}
  {{- printf "%s-%s" .Release.Name "postgresql" | trimSuffix "-" -}}
{{- end -}}

{{/*
Fully qualified memcached service name.
*/}}
{{- define "openproject.memcached.fullname" -}}
  {{- printf "%s-%s" .Release.Name "memcached" | trimSuffix "-" | b64enc -}}
{{- end -}}

{{/*
Fully qualified database URI.
*/}}
{{- define "openproject.databaseURI" -}}
  {{ $databaseURI := "" }}
  {{- if .Values.postgresql.enabled -}}
    {{- $databaseURI = (printf "%s%s%s%s%s%s%s%s" "postgresql://" .Values.postgresql.auth.username ":" .Values.postgresql.auth.password "@" (include "openproject.postgresql.fullname" . | lower ) "/" .Values.postgresql.auth.database ) -}}
  {{- else -}}
    {{- $databaseURI = (printf "%s%s%s%s%s%s%s%s%s%s" "postgres://" .Values.postgresql.auth.username ":" .Values.postgresql.auth.password "@" .Values.postgresql.host ":" .Values.postgresql.port "/" .Values.postgresql.auth.database ) -}}
  {{- end -}}
  {{- printf "%s" $databaseURI | b64enc -}}
{{- end -}}

{{/*
Openproject Deployment root path to storage app attachments and database data.
*/}}
{{- define "openproject.storageRootPath" }}
  {{- if .Values.volumeMounts }}{{ if and .Values.volumeMounts .Values.volumeMounts.mountPath }}
    {{- printf "%s" .Values.volumeMounts.mountPath -}}
  {{- end }}{{ end }}
{{- end -}}
