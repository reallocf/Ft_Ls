/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ls_flag_functions.c                                :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: csummers <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2016/12/13 14:28:06 by csummers          #+#    #+#             */
/*   Updated: 2016/12/13 14:28:07 by csummers         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_ls.h"

t_ls			*ls_initialize(void)
{
	t_ls	*ls_f;

	if (!(ls_f = (t_ls*)malloc(sizeof(t_ls))))
		ls_die(NULL);
	ls_f->l = 0;
	ls_f->cap_r = 0;
	ls_f->a = 0;
	ls_f->r = 0;
	ls_f->t = 0;
	ls_f->u = 0;
	ls_f->c = 0;
	ls_f->f = 0;
	ls_f->one = 0;
	return (ls_f);
}

static void		ls_illegal_flag(char c)
{
	ft_printf("%wft_ls: illegal option -- %c\n", 2, c);
	ft_printf("%wusage: ./ft_ls [-Racflrtu1] [file...]\n", 2);
	exit(1);
}

static void		ls_get_bonus_flag(t_ls **ls_f, char c)
{
	if (c == 'u')
	{
		(*ls_f)->u = 1;
		(*ls_f)->c = 0;
	}
	else if (c == 'c')
	{
		(*ls_f)->c = 1;
		(*ls_f)->u = 0;
	}
	else if (c == 'f')
	{
		(*ls_f)->a = 1;
		(*ls_f)->f = 1;
	}
	else if (c == '1')
		(*ls_f)->one = 1;
}

static t_ls		*ls_get_flag(t_ls **ls_f, char *flag)
{
	if (*flag == '-' && *(flag + 1) == '\0')
		return (*ls_f);
	while (*flag)
	{
		if (*flag == 'l')
			(*ls_f)->l = 1;
		else if (*flag == 'R')
			(*ls_f)->cap_r = 1;
		else if (*flag == 'a')
			(*ls_f)->a = 1;
		else if (*flag == 'r')
			(*ls_f)->r = 1;
		else if (*flag == 't')
			(*ls_f)->t = 1;
		else if (*flag == 'u' || *flag == 'c' || *flag == 'f' || *flag == '1')
			ls_get_bonus_flag(ls_f, *flag);
		else
		{
			free(*ls_f);
			ls_illegal_flag(*flag);
		}
		flag++;
	}
	return (*ls_f);
}

char			**ls_organize_argv(t_ls *ls_f, int argc, char **argv)
{
	int		i;
	int		finding_flags;
	char	**ret;

	ret = NULL;
	finding_flags = 1;
	i = 1;
	while (i < argc)
	{
		if (finding_flags && argv[i][0] == '-' && argv[i][1])
			ls_get_flag(&ls_f, argv[i] + 1);
		else
		{
			finding_flags = 0;
			if (!(ret = ft_realloc_s(&ret, argv[i])))
				ls_die(NULL);
		}
		i++;
	}
	return (ret);
}
