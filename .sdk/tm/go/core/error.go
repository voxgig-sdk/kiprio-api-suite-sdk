package core

type KiprioApiSuiteError struct {
	IsKiprioApiSuiteError bool
	Sdk              string
	Code             string
	Msg              string
	Ctx              *Context
	Result           any
	Spec             any
}

func NewKiprioApiSuiteError(code string, msg string, ctx *Context) *KiprioApiSuiteError {
	return &KiprioApiSuiteError{
		IsKiprioApiSuiteError: true,
		Sdk:              "KiprioApiSuite",
		Code:             code,
		Msg:              msg,
		Ctx:              ctx,
	}
}

func (e *KiprioApiSuiteError) Error() string {
	return e.Msg
}
